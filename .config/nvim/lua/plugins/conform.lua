require("conform").setup({
  notify_on_error = false,
  notify_no_formatters = false,
  formatters_by_ft = {
    go = { "gopls" },
    json = { "prettier", name = "dprint" },
    jsonc = { "prettier", name = "dprint" },
    lua = { "stylua" },
    markdown = { "prettier" },
    typescript = { "prettier", name = "dprint", timeout_ms = 500 },
    typescriptreact = { "prettier", name = "dprint", timeout_ms = 500 },
    yaml = { "prettier" },
    -- For filetypes without a formatter:
    ["_"] = { "trim_whitespace", "trim_newlines" },
  },
  format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  formatters = {
    -- Require a Prettier configuration file to format.
    prettier = { require_cwd = true },
  },
})
