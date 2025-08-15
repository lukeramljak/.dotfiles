vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
vim.keymap.set("n", "<leader>ex", "<cmd>Ex %:p:h<cr>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<S-h>", "<cmd>bprev<cr>", { noremap = true, silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { noremap = true, silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { noremap = true, silent = true, desc = "Delete Buffer" })

vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>", { noremap = true, silent = true, desc = "Move to Left Window" })
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>", { noremap = true, silent = true, desc = "Move to Down Window" })
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>", { noremap = true, silent = true, desc = "Move to Up Window" })
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>", { noremap = true, silent = true, desc = "Move to Right Window" })

vim.keymap.set("n", "<leader>-", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>_", "<cmd>vsplit<cr>")

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>")

vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pu", "<cmd>lua vim.pack.update()<cr>", { noremap = true, silent = true })
