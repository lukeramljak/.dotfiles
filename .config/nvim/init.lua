vim.g.projects_dir = vim.env.HOME .. "/dev"

require("settings")
require("autocmds")
require("commands")
require("keymaps")
require("lsp")
require("winbar")

require("plugins")
require("plugins.colorscheme")
require("plugins.blink")
require("plugins.conform")
require("plugins.fzf-lua")
require("plugins.gitsigns")
require("plugins.grug-far")
require("plugins.mini")
require("plugins.nvim-autopairs")
require("plugins.nvim-ts-autotag")
require("plugins.quicker")
require("plugins.treesitter")

-- Interactive textual undotree
vim.cmd.packadd("nvim.undotree")

-- Enable the new experimental command-line features
require("vim._extui").enable({})
