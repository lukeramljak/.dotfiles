return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

    -- stylua: ignore start
		vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show harpoon list" })
		vim.keymap.set("n", "<leader>hm", function() harpoon:list():append() end, { desc = "Mark file with harpoon" })
		vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Go to previous harpoon mark" })
		vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Go to next harpoon mark" })
    end,
  },

  {
    {
      "laytan/tailwind-sorter.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
      build = "cd formatter && npm i && npm run build",
      config = true,
      opts = {
        on_save_enabled = true,
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
  },
}
