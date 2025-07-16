vim.lsp.enable({
  "cssls",
  "gopls",
  "html",
  "lua_ls",
  "tailwindcss",
  "vtsls",
})

-- Change the Diagnostic symbols in the sign column (gutter)
local x = vim.diagnostic.severity
vim.diagnostic.config({
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
  underline = true,
  float = { border = "single" },
})

vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})
