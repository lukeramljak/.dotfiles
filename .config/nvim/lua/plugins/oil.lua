vim.pack.add({"https://github.com/stevearc/oil.nvim"})

require("oil").setup()

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
vim.keymap.set("n", "-", "<cmd>Oil<cr>")
