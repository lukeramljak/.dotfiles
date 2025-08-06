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
vim.o.scrolloff = 10
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.incsearch = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.winborder = "rounded"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { noremap = true, silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { noremap = true, silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { noremap = true, silent = true, desc = "Delete Buffer" })

vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>", { noremap = true, silent = true, desc = "Move to Left Window" })
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>", { noremap = true, silent = true, desc = "Move to Down Window" })
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>", { noremap = true, silent = true, desc = "Move to Up Window" })
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>", { noremap = true, silent = true, desc = "Move to Right Window" })

vim.keymap.set("n", "<leader>gg", function()
  vim.cmd.split()
  vim.cmd.resize(vim.o.lines)
  vim.cmd.startinsert()

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)

  vim.fn.jobstart("lazygit", {
    term = true,
    on_exit = function()
      vim.api.nvim_win_close(win, true)
    end,
  })
end, { desc = "Open lazygit" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.lsp.enable({ "eslint", "gopls", "golangci_lint_ls", "lua_ls", "tailwindcss", "vtsls" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.o.completeopt = "menu,menuone,noinsert,fuzzy,popup"
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})

vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/projekt0n/github-nvim-theme" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/catppuccin/nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

require("catppuccin").setup()
vim.cmd([[colorscheme catppuccin]])

require("conform").setup({
  formatters_by_ft = {
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    lua = { "stylua" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "eslint-lsp",
    "golangci-lint-langserver",
    "gopls",
    "lua-language-server",
    "prettierd",
    "stylua",
    "tailwindcss-language-server",
    "vtsls",
  },
})

require("mini.ai").setup()
require("mini.diff").setup({ view = { style = "sign" } })

require("mini.files").setup()
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>")
vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<cr>")

require("mini.hipatterns").setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
  },
})

require("mini.icons").setup()

local notify = require("mini.notify")
notify.setup()
vim.notify = notify.make_notify()

require("mini.pairs").setup()

local pick = require("mini.pick")
pick.setup()
vim.ui.select = pick.ui_select

vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>")

require("mini.statusline").setup()

require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "json", "lua", "markdown", "tsx", "typescript" },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

require("treesitter-context").setup({ max_lines = 3 })

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function()
    vim.cmd("TSUpdate")
  end,
})
