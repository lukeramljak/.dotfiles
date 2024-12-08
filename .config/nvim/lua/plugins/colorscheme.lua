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
        background = { light = 'latte', dark = 'mocha' },
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
        integrations = {
          grug_far = true,
          telescope = {
            enabled = true,
            style = 'nvchad',
          },
          which_key = true,
        },
      }
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'vague2k/vague.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vague').setup {
        transparent = true,
        style = {
          strings = 'none',
        },
      }
    end,
  },
}
