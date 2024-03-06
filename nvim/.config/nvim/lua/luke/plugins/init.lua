return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

    -- stylua: ignore start
	vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show harpoon list" })
	vim.keymap.set("n", "<leader>hm", function() harpoon:list():append() end, { desc = "Mark file with harpoon" })
	vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Go to previous harpoon mark" })
	vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Go to next harpoon mark" })
    end,
  },

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

  {
    'mfussenegger/nvim-lint',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        svelte = { 'eslint_d' },
        python = { 'pylint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  'tpope/vim-fugitive',
  'christoomey/vim-tmux-navigator',
}
