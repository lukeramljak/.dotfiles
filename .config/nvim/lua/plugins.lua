vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/christoomey/vim-tmux-navigator",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
  no_italic = true,
  integrations = {
    indent_blankline = {
      enabled = true,
      scope_color = "surface1",
      colored_indent_levels = false,
    },
  },
})
vim.cmd.colorscheme("catppuccin-mocha")

require("conform").setup({
  notify_on_error = false,
  notify_no_formatters = false,
  formatters_by_ft = {
    go = { "gopls" },
    json = { "prettier", name = "dprint" },
    jsonc = { "prettier", name = "dprint" },
    lua = { "stylua" },
    markdown = { "prettier" },
    typescript = { "prettier", name = "dprint", timeout_ms = 500 },
    typescriptreact = { "prettier", name = "dprint", timeout_ms = 500 },
    yaml = { "prettier" },
    -- For filetypes without a formatter:
    ["_"] = { "trim_whitespace", "trim_newlines" },
  },
  format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  formatters = {
    -- Require a Prettier configuration file to format.
    prettier = { require_cwd = true },
  },
})

local misc_icons = require("icons").misc
require("ibl").setup({
  indent = {
    char = misc_icons.vertical_bar,
    tab_char = misc_icons.vertical_bar,
  },
  scope = { show_start = false, show_end = false },
})

require("mini.ai").setup()
require("mini.completion").setup()
require("mini.diff").setup()
require("mini.extra").setup()
require("mini.files").setup({
  mappings = {
    go_in_plus = "<cr>",
    synchronize = "<c-s>",
  },
  windows = {
    max_number = 3,
    preview = true,
    width_nofocus = math.floor((vim.o.columns - 5) * 0.25), -- 25% of screen minus border+padding
    width_focus = math.floor((vim.o.columns - 5) * 0.25), -- 25% of screen minus border+padding
    width_preview = math.floor((vim.o.columns - 3) * 0.5), -- 50% of screen minus border+padding,
  },
})
require("mini.git").setup()
require("mini.icons").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.pick").setup({
  options = {
    content_from_bottom = true,
  },
  mappings = {
    marked_to_quickfix = {
      char = "<C-q>",
      func = function()
        local items = MiniPick.get_picker_matches().marked or {}
        MiniPick.default_choose_marked(items)
        MiniPick.stop()
      end,
    },
    all_to_quickfix = {
      char = "<A-q>",
      func = function()
        local matched_items = MiniPick.get_picker_matches().all or {}
        MiniPick.default_choose_marked(matched_items)
        MiniPick.stop()
      end,
    },
  },
})
require("mini.statusline").setup()
require("mini.tabline").setup()

vim.notify = MiniNotify.make_notify()

require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "json", "lua", "markdown", "tsx", "typescript" },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
require("treesitter-context").setup({ max_lines = 3 })
