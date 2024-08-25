return {
  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('colorizer').setup {
        user_default_options = {
          css = true,
          tailwind = true,
        },
        filetypes = {
          '!cmp_menu',
        },
        buftypes = {
          '*',
          -- exclude prompt and popup buftypes from highlight
          '!prompt',
          '!popup',
        },
      }
    end,
  },
}
