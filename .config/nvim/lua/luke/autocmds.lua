-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = vim.api.nvim_create_augroup('ts_import', { clear = true }),
--   pattern = '*.ts,*.tsx,*.jsx,*.js',
--   callback = function()
--     vim.cmd 'TSToolsAddMissingImports sync'
--     vim.cmd 'TSToolsOrganizeImports sync'
--   end,
-- })
