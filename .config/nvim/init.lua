vim.g.projects_dir = vim.env.HOME .. "/dev"

require("settings")
require("autocmds")
require("commands")
require("keymaps")
require("lsp")
require("winbar")

local function gh(url)
  return "https://github.com/" .. url
end

vim.pack.add({
  gh("saghen/blink.indent"),
  gh("saghen/blink.cmp"),
  gh("esmuellert/codediff.nvim"),
  gh("stevearc/conform.nvim"),
  gh("ibhagwan/fzf-lua"),
  gh("lewis6991/gitsigns.nvim"),
  gh("MagicDuck/grug-far.nvim"),
  gh("OXY2DEV/markview.nvim"),
  gh("nvim-mini/mini.nvim"),
  gh("MunifTanjim/nui.nvim"),
  gh("windwp/nvim-autopairs"),
  gh("nvim-treesitter/nvim-treesitter"),
  gh("nvim-treesitter/nvim-treesitter-context"),
  gh("windwp/nvim-ts-autotag"),
  gh("yioneko/nvim-vtsls"),
  gh("stevearc/quicker.nvim"),
  gh("vague-theme/vague.nvim"),
  { src = gh("catppuccin/nvim"), name = "catppuccin" },
})

-- Interactive textual undotree
vim.cmd.packadd("nvim.undotree")

-- Enable the new experimental command-line features
require("vim._core.ui2").enable({})
