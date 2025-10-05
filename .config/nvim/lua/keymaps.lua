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

-- quickfix list
vim.keymap.set("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- LSP
vim.keymap.set("n", "gd", function()
  MiniExtra.pickers.lsp({ scope = "definition" })
end)

-- Picker
vim.keymap.set("n", "<leader>ff", function()
  MiniPick.builtin.files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>/", function()
  MiniPick.builtin.grep_live()
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fd", function()
  MiniExtra.pickers.diagnostic()
end, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fh", function()
  MiniPick.builtin.help()
end, { desc = "Find help" })
vim.keymap.set("n", "<leader>fk", function()
  MiniExtra.pickers.keymaps()
end, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fs", function()
  MiniExtra.pickers.lsp({ scope = "document_symbol" })
end, { desc = "Find document symbols" })
vim.keymap.set("n", "<leader>fS", function()
  MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
end, { desc = "Find workspace symbols" })
vim.keymap.set("n", "<leader>gw", function()
  MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Grep current word" })

-- Files
vim.keymap.set("n", "<leader>e", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
  MiniFiles.reveal_cwd()
end, { desc = "Open Mini Files" })

-- Git
vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>G blame<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>G push<CR>")

-- Package manager
vim.keymap.set("n", "<leader>pu", "<cmd>lua vim.pack.update()<cr>")

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Misc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
