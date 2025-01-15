require("core.autocmds")
require("core.keymaps")
require("core.options")
require("core.lazy")

vim.lsp.enable({ "css-ls", "emmet-ls", "gopls", "html-ls", "lua_ls", "tailwind-ls", "vtsls" })
