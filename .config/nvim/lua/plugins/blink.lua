return {
  "saghen/blink.cmp",
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },
    sources = {
      default = { "lazydev", "lsp", "path", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
