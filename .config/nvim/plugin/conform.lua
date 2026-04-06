require("conform").setup({
  notify_on_error = false,
  notify_no_formatters = false,
  formatters_by_ft = {
    css = { "biome" },
    go = { "gofmt", "goimports" },
    javascript = { "biome", "prettier" },
    json = { "biome", "prettier" },
    jsonc = { "biome", "prettier" },
    lua = { "stylua" },
    markdown = { "biome", "prettier" },
    svelte = { "biome", "prettier" },
    typescript = { "biome", "prettier" },
    typescriptreact = { "biome", "prettier" },
    yaml = { "prettier" },
    -- For filetypes without a formatter:
    ["_"] = { "trim_whitespace", "trim_newlines" },
  },
  format_after_save = { timeout_ms = 500, lsp_format = "fallback" },
  formatters = {
    -- Require a configuration file to format.
    biome = { require_cwd = true },
    prettier = { require_cwd = true },
  },
})
