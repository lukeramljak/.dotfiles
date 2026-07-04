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
        javascript = { "biome-check", "prettier" },
        json = { "biome-check", "prettier" },
        jsonc = { "biome-check", "prettier" },
        lua = { "stylua" },
        markdown = { "biome-check", "prettier" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        svelte = { "biome-check", "prettier" },
        typescript = { "biome-check", "prettier" },
        typescriptreact = { "biome-check", "prettier" },
        yaml = { "prettier" },
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
        prettier = { require_cwd = true },
      },
    },
  },
})
