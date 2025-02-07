-- Change the Diagnostic symbols in the sign column (gutter)
local x = vim.diagnostic.severity
vim.diagnostic.config {
  signs = { text = { [x.ERROR] = '󰅙', [x.WARN] = '', [x.INFO] = '󰋼', [x.HINT] = '󰌵' } },
  underline = true,
  float = { border = 'single' },
}

vim.diagnostic.config({
  virtual_lines = true,
})

vim.api.nvim_create_user_command('LspInfo', function()
  vim.cmd('silent checkhealth vim.lsp')
end, { desc = 'Run LSP health check' })

vim.api.nvim_create_user_command("LspRestart", function()
  local detach_clients = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    client:stop(true)
    if vim.tbl_count(client.attached_buffers) > 0 then
      detach_clients[client.name] = { client, vim.lsp.get_buffers_by_client_id(client.id) }
    end
  end
  local timer = vim.uv.new_timer()
  timer:start(
    100,
    50,
    vim.schedule_wrap(function()
      for name, client in pairs(detach_clients) do
        local client_id = vim.lsp.start(client[1].config, { attach = false })
        if client_id then
          for _, buf in ipairs(client[2]) do
            vim.lsp.buf_attach_client(buf, client_id)
          end
          vim.notify(name .. ": restarted")
        end
        detach_clients[name] = nil
      end
      if next(detach_clients) == nil and not timer:is_closing() then
        timer:close()
      end
    end)
  )
end, {
  desc = "Restart all the language client(s) attached to the current buffer",
})

vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd.vsplit(vim.lsp.log.get_filename())
end, {
  desc = "Get all lsp logs",
})

vim.lsp.enable({ "css-ls", "emmet-ls", "gopls", "html-ls", "lua_ls", "tailwind-ls", "vtsls" })
