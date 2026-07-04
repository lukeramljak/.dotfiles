-- Enable the experimental Lua module loader
vim.loader.enable()

vim.g.projects_dir = vim.env.HOME .. "/dev"

require("settings")
require("autocmds")
require("commands")
require("keymaps")
require("lsp")
require("winbar")

-- Interactive textual undotree
vim.cmd.packadd("nvim.undotree")

-- Enable the new experimental command-line features
require("vim._core.ui2").enable({})
