local arrows = require("icons").arrows

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.smartindent = true

-- Show whitespace
vim.o.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

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

-- Disable line wrapping
vim.o.wrap = false

-- Rounded borders for floating and popup windows
vim.o.winborder = "rounded"

-- Sync clipboard between the OS and Neovim
vim.o.clipboard = "unnamedplus"

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Update times and timeouts
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10

-- Completion
vim.opt.wildignore:append({ ".DS_Store" })
vim.o.completeopt = "menuone,noselect,fuzzy,nosort"
vim.o.pumheight = 15
vim.o.pumborder = "rounded"

-- Save undo history
vim.o.undofile = true
vim.o.undolevels = 10000

-- Keep cursor centered
vim.o.scrolloff = 99
vim.o.scrolloffpad = 1

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Disable swapfile
vim.o.swapfile = false

-- Show cursorline
vim.o.cursorline = true

-- Folding
vim.o.foldcolumn = "1"
vim.o.foldlevelstart = 99
vim.wo.foldtext = ""

-- UI characters
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldclose = arrows.right,
  foldopen = arrows.down,
  foldsep = " ",
  foldinner = " ",
  msgsep = "─",
}

-- Status line
vim.o.laststatus = 3
vim.o.cmdheight = 0

-- Specify what’s saved in a session. Needs options to work properly
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,options"

-- Diff mode settings
-- Setting the context to a very large number disables folding.
vim.opt.diffopt:append("followwrap,vertical,context:99")

vim.opt.shortmess:append({
  w = true,
  s = true,
})

-- Disable cursor blinking in terminal mode
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-TermCursor"

-- Disable health checks for these providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
