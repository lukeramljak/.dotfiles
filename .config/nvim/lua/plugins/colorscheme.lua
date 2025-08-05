return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
    opts = {
      auto_integrations = true,
      no_italic = true,
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    opts = {},
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
