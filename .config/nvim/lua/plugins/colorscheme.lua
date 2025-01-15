return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    enabled = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        integrations = {
          cmp = true,
          grug_far = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          notify = true,
          snacks = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "vague2k/vague.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = true,
        style = {
          strings = "none",
        },
      })
    end,
  },
}
