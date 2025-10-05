vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("lukeramljak/yank_highlight", { clear = true }),
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("lukeramljak/resize_splits", { clear = true }),
  desc = "Resize splits on window resize",
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("lukeramljak/treesitter_updated", { clear = true }),
  desc = "Update TS parsers when updating plugin",
  ---@param event {data: {kind: "install" | "update" | "delete", path: string, spec: vim.pack.Spec}}
  callback = function(event)
    if event.data.spec.name == "nvim-treesitter" and event.data.kind == "update" then
      vim.schedule(function()
        vim.cmd("TSUpdate")
      end)
    end
  end,
})
