local add = require("vim-pack").add

add({
  {
    src = "catppuccin/nvim",
    module_name = "catppuccin",
    opts = {
      float = {
        transparent = true,
        solid = false,
      },
      no_italic = true,
      transparent_background = true,
    },
  },
})

vim.cmd.colorscheme("catppuccin-mocha")
