local arrows = require("icons").arrows

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.smartindent = true

-- Show whitespace
vim.o.list = false
-- vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Case insensitive searching UNLESS /C or the search has capitals.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Show where the pattern is when searching
vim.o.incsearch = true

-- Show effects of substitution as you type
vim.o.inccommand = "split"

-- Wrap long lines at words
vim.o.linebreak = true

-- Rounded borders for floating and popup windows
vim.o.winborder = "rounded"
vim.o.pumborder = "rounded"

-- Sync clipboard between the OS and Neovim
vim.o.clipboard = "unnamedplus"

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Update times and timeouts
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10

-- Completion
vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.pumheight = 15

-- Save undo history
vim.o.undofile = true
vim.o.undolevels = 10000

-- Minimum number of lines to keep above and below cursor when scrolling
vim.o.scrolloff = 4

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Disable swapfile
vim.o.swapfile = false

-- Show cursorline
vim.o.cursorline = true

-- Folding
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldtext = ""
vim.opt.fillchars = {
  fold = " ",
  foldclose = arrows.right,
  foldopen = arrows.down,
  foldsep = " ",
  foldinner = " ",
}
