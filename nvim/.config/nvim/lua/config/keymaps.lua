local map = vim.keymap.set

-- move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

map("n", "<leader>fl", vim.cmd.Ex, { desc = "Open netrw" })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>cr", vim.lsp.buf.references, { desc = "Go to reference" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- formatting
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })

-- telescope
-- find
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>", { desc = "Buffers" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files (root dir)" })
map("n", "<leader><space>", "<cmd>Telescope find_files<CR>", { desc = "Find Files (root dir)" })
map("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Find Files (git-files)" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent" })
-- git
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "status" })

-- gitsigns
map("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
map("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev Hunk" })
map({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
map({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
map("n", "<leader>ghS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage Buffer" })
map("n", "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo Stage Hunk" })
map("n", "<leader>ghR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset Buffer" })
map("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Preview Hunk Inline" })
map("n", "<leader>ghb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Blame" })
map("n", "<leader>ghd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff This" })
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk" })

-- spectre
map("n", "<leader>sr", function()
	require("spectre").open()
end, { desc = "Replace in files (Spectre)" })

-- tmux
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Go to left tmux pane" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Go to lower tmux pane" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Go to upper tmux pane" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Go to right tmux pane" })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", { desc = "Go to previous tmux pane" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
