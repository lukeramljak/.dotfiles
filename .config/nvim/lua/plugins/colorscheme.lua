return {
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    priority = 1000,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        no_italic = true,
        term_colors = true,
        transparent_background = false,
        styles = {
          comments = {},
          functions = {},
          keywords = {},
          operators = {},
          conditionals = {},
          loops = {},
          booleans = {},
          numbers = {},
          types = {},
          strings = {},
          variables = {},
          properties = {},
        },
        color_overrides = {
          mocha = {
            base = '#191928',
          },
        },
        integrations = {
          grug_far = true,
          telescope = {
            enabled = true,
            style = 'nvchad',
          },
          which_key = true,
        },
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
  },
}
