---@type vim.lsp.Config
return {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = {
    'html',
    'typescriptreact',
    'javascriptreact',
    'css',
    'sass',
    'scss',
  },
}
