local add_on_event = require("vim-pack").add_on_event

add_on_event("BufReadPre", {
  {
    src = "kdheepak/lazygit.nvim",
    on_setup = function()
      vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open lazygit" })
    end,
  },
})
