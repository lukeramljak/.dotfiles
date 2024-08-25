return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = "<C-y>",
      },
      log_level = "off",
    },
  },
}
