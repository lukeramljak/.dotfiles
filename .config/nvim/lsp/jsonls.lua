--- Install with: npm i -g vscode-langservers-extracted

local util = require("lsp")

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = util.resolve_node_modules_cmd("vscode-json-language-server", config)
    return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
  end,
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { ".git" },
}
