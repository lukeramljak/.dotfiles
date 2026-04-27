--- Install with: npm i -g vscode-langservers-extracted

local util = require("lsp")

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = util.resolve_node_modules_cmd("vscode-css-language-server", config)
    return vim.lsp.rpc.start({ cmd, "--stdio" }, dispatchers)
  end,
  filetypes = { "css", "scss", "less" },
  init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
  root_markers = { "package.json", ".git" },
  settings = {
    css = { validate = true, lint = { unknownAtRules = "ignore" } },
    scss = { validate = true },
    less = { validate = true },
  },
}
