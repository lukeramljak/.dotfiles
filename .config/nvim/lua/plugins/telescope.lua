return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cmd = 'Telescope',
    init = function()
      local builtin = require 'telescope.builtin'
      local wk = require 'which-key'
      wk.add {
        { '<leader>f', group = 'file' }, -- group
        { '<leader>ff', builtin.find_files, desc = 'Find File', mode = 'n' },
        { '<leader>fb', builtin.buffers, desc = 'Find Buffer', mode = 'n' },
        { '<leader>fg', builtin.live_grep, desc = 'Find with Grep', mode = 'n' },
        { '<leader>fh', builtin.help_tags, desc = 'Find Help', mode = 'n' },
        { '<leader>fn', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>', desc = 'File Browser', mode = 'n' },
      }
    end,
    opts = function()
      return {
        defaults = {
          prompt_prefix = '   ',
          selection_caret = ' ',
          entry_prefix = ' ',
          sorting_strategy = 'ascending',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
          mappings = {
            n = { ['q'] = require('telescope.actions').close },
          },
          vimgrep_arguments = {
            'rg',
            '-L',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
          previewer = true,
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        },
        extensions = {
          file_browser = {
            theme = 'ivy',
            hijack_netrw = true,
          },
        },
        extensions_list = {
          'file_browser',
        },
      }
    end,
    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
}
