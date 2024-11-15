local map = vim.keymap.set

map('n', '<s-h>', '<cmd>BufferPrevious<cr>', { desc = 'Move to previous buffer' })
map('n', '<s-l>', '<cmd>BufferNext<cr>', { desc = 'Move to next buffer' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
