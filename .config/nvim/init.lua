vim.g.mapleader = " "
vim.g.localmapleader = " "

require("autocmds")
require("keymaps")
require("lsp")
require("settings")

require("plugins")
require("plugins.colorscheme")
require("plugins.conform")
require("plugins.ibl")
require("plugins.mini")
require("plugins.treesitter")
