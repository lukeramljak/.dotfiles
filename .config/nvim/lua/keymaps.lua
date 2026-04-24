-- Indent while remaining in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

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
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Bulk replace string under cursor", silent = false }
)
vim.keymap.set("n", "<leader>R", function()
  local session = vim.fn.stdpath("state") .. "/restart_session.vim"
  vim.cmd("mksession! " .. vim.fn.fnameescape(session))
  vim.cmd("restart source " .. vim.fn.fnameescape(session))
end, { desc = "Restart Neovim" })
