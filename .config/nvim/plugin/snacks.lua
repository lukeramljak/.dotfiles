local add = require("vim-pack").add

add({
  {
    src = "folke/snacks.nvim",
    opts = {
      gh = {},
      lazygit = {},
      picker = {
        sources = {
          gh_issue = {},
          gh_pr = {},
        },
      },
    },
    on_setup = function()
      -- stylua: ignore start
      vim.keymap.set("n", "<leader>gi", function() Snacks.picker.gh_issue() end, { desc = "GitHub Issues (all)" })
      vim.keymap.set("n", "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" })
      vim.keymap.set("n", "<leader>gp", function() Snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
      vim.keymap.set("n", "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, { desc = "GitHub Pull Requests (all)" })

      vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit.open() end, { desc = "Open lazygit" })
      -- stylue: ignore end
    end,
  },
})
