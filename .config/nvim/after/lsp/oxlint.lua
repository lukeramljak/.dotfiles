---@type vim.lsp.Config
return {
  --- disable the oxfmt lsp server since conform is used for formatting
  oxfmt = { enabled = false },
}
