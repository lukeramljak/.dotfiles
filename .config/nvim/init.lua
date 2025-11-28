vim.g.mapleader = " "
vim.g.localmapleader = " "

require("autocmds")
require("keymaps")
require("lsp")
require("settings")

require("plugins")
require("plugins.colorscheme")
require("plugins.conform")
require("plugins.gitsigns")
require("plugins.indent")
require("plugins.mini")
require("plugins.oil")
require("plugins.snacks")
require("plugins.treesitter")
