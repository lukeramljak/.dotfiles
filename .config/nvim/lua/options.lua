vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.inccommand = "split"
vim.o.scrolloff = 8
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.incsearch = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.winborder = "rounded"
vim.o.colorcolumn = "80"
vim.o.completeopt = "menuone,noselect,fuzzy,nosort"

vim.cmd("colorscheme github_dark_default")
vim.notify = require("mini.notify").make_notify()
