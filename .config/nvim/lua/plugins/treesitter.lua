require("nvim-treesitter.configs").setup({
  ensure_installed = { "css", "go", "json", "html", "lua", "markdown", "svelte", "tsx", "typescript" },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
require("treesitter-context").setup({
  -- Avoid the sticky context from growing a lot
  max_lines = 3,
  -- Match the context lines to the source code
  multiline_threshold = 1,
  -- Disable it when the window is too small
  min_window_height = 20,
})
