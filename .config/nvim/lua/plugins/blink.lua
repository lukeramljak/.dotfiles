return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'L3MON4D3/LuaSnip',
  },
  event = 'InsertEnter',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',

    completion = {
      menu = {
        draw = {
          treesitter = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      list = {
        selection = 'manual',
      },
      ghost_text = {
        enabled = true,
      },
    },

    -- experimental auto-brackets support
    accept = { auto_brackets = { enabled = true } },

    snippets = {
      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction)
        require('luasnip').jump(direction)
      end,
    },

    sources = {
      completion = {
        enabled_providers = { 'lsp', 'path', 'luasnip', 'buffer', 'lazydev' },
      },
      providers = {
        lsp = {
          -- dont show LuaLS require statements when lazydev has items
          fallback_for = { 'lazydev' },
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
        },
      },
    },

    keymap = {
      preset = 'enter',
      ['<Tab>'] = {
        function()
          if require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
          end
        end,
      },
    },
  },

  opts_extend = {'sources.completion.enabled_providers'},
}
