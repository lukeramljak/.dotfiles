local map = vim.keymap.set
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- navigate buffers
map("n", "<S-h>", "<cmd>bprev<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })

map("n", "<c-h>", "<cmd>wincmd h<CR>", { noremap = true, silent = true, desc = "Move to Left Window" })
map("n", "<c-j>", "<cmd>wincmd j<CR>", { noremap = true, silent = true, desc = "Move to Down Window" })
map("n", "<c-k>", "<cmd>wincmd k<CR>", { noremap = true, silent = true, desc = "Move to Up Window" })
map("n", "<c-l>", "<cmd>wincmd l<CR>", { noremap = true, silent = true, desc = "Move to Right Window" })

vim.keymap.set("i", "<Tab>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, {
  silent = true,
})
