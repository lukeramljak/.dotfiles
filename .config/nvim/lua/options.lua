local arrows = require("icons").arrows

vim.o.autowrite = true
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.expandtab = true
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldtext = ""
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.incsearch = true
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 4
vim.o.shiftwidth = 2
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smoothscroll = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 200
vim.o.winborder = "rounded"
vim.o.wrap = false

vim.opt.fillchars = {
  fold = " ",
  foldclose = arrows.right,
  foldopen = arrows.down,
  foldsep = " ",
  foldinner = " ",
}

vim.opt.listchars = {
  space = "⋅",
  trail = "⋅",
  tab = "  ↦",
}
