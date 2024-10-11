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
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
