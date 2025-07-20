return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    enabled = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    priority = 1000,
    opts = {
      transparent_background = true,
      no_italic = true,
      integrations = {
        blink_cmp = true,
        cmp = true,
        grug_far = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        notify = true,
        snacks = true,
        which_key = true,
      },
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        groups = {
          all = {
            Whitespace = { link = "Comment" },
            IncSearch = { bg = "palette.cyan" },
          },
          github_dark_default = {
            SnacksIndent = { fg = "#262a2e", nocombine = true },
            SnacksIndentScope = { fg = "#383a3d", nocombine = true },
          },
        },
      })
      vim.cmd("colorscheme github_dark_default")
    end,
  },
  {
    "vague2k/vague.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {
      transparent = true,
      style = {
        strings = "none",
      },
    },
  },
}
