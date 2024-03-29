return {
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('codeium').setup {
        enable_chat = true,
      }
    end,
  },

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
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    keys = {
      {
        '<leader>fe',
        function()
          require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd() }
        end,
        desc = 'Explorer NeoTree (cwd)',
      },
      { '<leader>fE', '<leader>fe', desc = 'Explorer NeoTree (root dir)', remap = true },
      { '<leader>E', '<leader>fE', desc = 'Explorer NeoTree (cwd)', remap = true },
      {
        '<leader>ge',
        function()
          require('neo-tree.command').execute { source = 'git_status', toggle = true }
        end,
        desc = 'Git explorer',
      },
      {
        '<leader>be',
        function()
          require('neo-tree.command').execute { source = 'buffers', toggle = true }
        end,
        desc = 'Buffer explorer',
      },
    },
    deactivate = function()
      vim.cmd [[Neotree close]]
    end,
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == 'directory' then
          require 'neo-tree'
        end
      end
    end,

    opts = {
      sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
      open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ['<space>'] = 'none',
          ['Y'] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg('+', path, 'c')
            end,
            desc = 'copy path to clipboard',
          },
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
      },
    },
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
    keys = {
      {
        '<leader>co',
        '<cmd>:TSToolsOrganizeImports<CR>',
        desc = 'Organise Imports',
      },
      {
        '<leader>cR',
        '<cmd>:TSToolsRemoveUnused<CR>',
        desc = 'Remove Unused Imports',
      },
    },
    opts = {
      settings = {
        expose_as_code_action = 'all',
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    },
  },

  'tpope/vim-fugitive',
  'christoomey/vim-tmux-navigator',
}
