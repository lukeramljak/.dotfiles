return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "onsails/lspkind.nvim" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },

      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      },

      ghost_text = { enabled = true },

    },

    sources = {
      default = { "lazydev", "lsp", "path", "buffer" },
      cmdline = {},
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    signature = { enabled = true },
  },

  opts_extend = { "sources.default" },
}
