vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "go", "json", "lua", "markdown", "tsx", "typescript" },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
require("treesitter-context").setup({ max_lines = 3 })
