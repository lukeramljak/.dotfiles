vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("lukeramljak/yank_highlight", { clear = true }),
  desc = "Highlight on yank",
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = vim.api.nvim_create_augroup("lukeramljak/resize_splits", { clear = true }),
  desc = "Resize splits on window resize",
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})
