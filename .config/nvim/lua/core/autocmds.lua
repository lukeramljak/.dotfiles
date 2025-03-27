local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

local yank_group = augroup("HighlightYank")

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

-- local function organize_imports()
--   local ft = vim.bo.filetype:gsub("react$", "")
--   if not vim.tbl_contains({ "javascript", "typescript" }, ft) then
--     return
--   end
--   local ok = vim.lsp.buf_request_sync(0, "workspace/executeCommand", {
--     command = (ft .. ".organizeImports"),
--     arguments = { vim.api.nvim_buf_get_name(0) },
--   }, 3000)
--   if not ok then
--     print("Command timeout or failed to complete.")
--   end
-- end
--
-- autocmd("BufWritePre", {
--   pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
--   callback = function()
--     require("conform").format({ async = false })
--     organize_imports()
--   end,
-- })

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    require("copilot.suggestion").dismiss()
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})
