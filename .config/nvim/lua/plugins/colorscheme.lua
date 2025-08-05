vim.pack.add({
  { src = "https://github.com/catppuccin/nvim" },
  { src = "https://github.com/projekt0n/github-nvim-theme" },
  { src = "https://github.com/vague2k/vague.nvim" }
})

require("catppuccin").setup({
      auto_integrations = true,
      no_italic = true,
})

vim.cmd[[colorscheme catppuccin-mocha]]
