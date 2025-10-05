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
