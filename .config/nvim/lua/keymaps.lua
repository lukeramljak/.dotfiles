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

-- Moving between windows
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<cr>", { desc = "Move to Left Window", remap = true })
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<cr>", { desc = "Move to Down Window", remap = true })
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<cr>", { desc = "Move to Up Window", remap = true })
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<cr>", { desc = "Move to Right Window", remap = true })

-- Splits
vim.keymap.set("n", "<leader>_", "<cmd>split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical split" })

-- Git
vim.keymap.set("n", "<leader>gg", function()
  require("term").open("lazygit")
end, { desc = "Open lazygit in floating terminal" })

-- Package manager
vim.keymap.set("n", "<leader>pu", "<cmd>lua vim.pack.update()<cr>", { desc = "Update plugins" })

-- Misc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<leader>r", "<cmd>restart<cr>", { desc = "Restart neovim" })
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Bulk replace string under cursor", silent = false }
)
