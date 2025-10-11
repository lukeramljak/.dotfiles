require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "json", "lua", "markdown", "svelte", "tsx", "typescript" },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
require("treesitter-context").setup({ max_lines = 3 })
