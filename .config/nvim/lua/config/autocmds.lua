local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- Show diagnostics under cursor
-- Replaced by rachartier/tiny-inline-diagnostic.nvim
-- autocmd({ 'CursorHold' }, {
--   pattern = '*',
--   callback = function()
--     for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
--       if vim.api.nvim_win_get_config(winid).zindex then
--         return
--       end
--     end
--     vim.diagnostic.open_float {
--       scope = 'cursor',
--       focusable = false,
--       close_events = {
--         'CursorMoved',
--         'CursorMovedI',
--         'BufHidden',
--         'InsertCharPre',
--         'WinLeave',
--       },
--     }
--   end,
-- })

-- Fix conceallevel for json files
autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- autocmd({ 'BufWritePre' }, {
--   group = augroup('ts_imports'),
--   pattern = { '*.tsx,*.ts' },
--   callback = function()
--     vim.lsp.buf.code_action {
--       apply = true,
--       context = {
--         only = { 'source.organizeImports' },
--         diagnostics = {},
--       },
--     }
--   end,
-- })
