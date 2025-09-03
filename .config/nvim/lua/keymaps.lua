vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Indent while remaining in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- Keeping the cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous result" })

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { desc = "Previous Buffer", remap = true })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer", remap = true })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer", remap = true })

-- Moving between windows
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>", { desc = "Move to Left Window", remap = true })
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>", { desc = "Move to Down Window", remap = true })
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>", { desc = "Move to Up Window", remap = true })
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>", { desc = "Move to Right Window", remap = true })

-- Splits
vim.keymap.set("n", "<leader>_", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>")

-- LSP
vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", { noremap = true, silent = true })

-- Picker
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>")

-- Files
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "Open mini.files in directory of current file" })

-- Git
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>")

-- Package manager
vim.keymap.set("n", "<leader>pu", "<cmd>lua vim.pack.update()<cr>")

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Misc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
