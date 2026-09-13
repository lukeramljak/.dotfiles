local add_on_event = require("vim-pack").add_on_event

add_on_event("BufWritePre", {
  {
    src = "stevearc/conform.nvim",
    opts = {
      notify_on_error = false,
      notify_no_formatters = false,
      formatters_by_ft = {
        caddy = { "caddy" },
        css = { "biome-check" },
        go = { "goimports", "gofumpt" },
        javascript = { "biome-check", "oxfmt", stop_after_first = true },
        json = { "biome-check", "oxfmt", stop_after_first = true },
        jsonc = { "biome-check", "oxfmt", stop_after_first = true },
        lua = { "stylua" },
        markdown = { "biome-check", "oxfmt", stop_after_first = true },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        svelte = { "biome-check", "oxfmt", stop_after_first = true },
        typescript = { "biome-check", "oxfmt", stop_after_first = true },
        typescriptreact = { "biome-check", "oxfmt", stop_after_first = true },
        yaml = { "oxfmt" },
        -- For filetypes without a formatter:
        ["_"] = { "trim_whitespace", "trim_newlines" },
      },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
      formatters = {
        caddy = {
          command = "caddy",
          args = { "fmt", "-" },
          stdin = true,
        },
        -- Require a configuration file to format
        biome = { require_cwd = true },
        oxfmt = { require_cwd = true },
      },
    },
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
