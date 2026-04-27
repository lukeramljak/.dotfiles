-- Install with: npm i -g vscode-langservers-extracted

local util = require("lsp")

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = util.resolve_node_modules_cmd("vscode-html-language-server", config)
    return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
  end,
  filetypes = { "html" },
  embeddedLanguages = { css = true, javascript = true },
}
