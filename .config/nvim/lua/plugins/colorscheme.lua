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
      vim.cmd.colorscheme 'vague'
    end,
  },
  -- {
  --   'cdmill/neomodern.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('neomodern').setup {
  --       theme = 'roseprime',
  --       plugin = {
  --         telescope = 'borderless',
  --       },
  --     }
  --     require('neomodern').load()
  --   end,
  -- },
}
