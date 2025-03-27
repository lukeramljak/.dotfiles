---@type vim.lsp.Config
return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'sass' },
  root_markers = { "package.json", ".git" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
