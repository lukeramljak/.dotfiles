require("conform").setup({
  notify_on_error = false,
  notify_no_formatters = false,
  formatters_by_ft = {
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
  format_on_save = { timeout_ms = 3000, async = false, quiet = false, lsp_format = "fallback" },
  formatters = {
    -- Require a configuration file to format.
    biome = { require_cwd = true },
    prettier = { require_cwd = true },
  },
})
