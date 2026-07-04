local add = require("vim-pack").add

add({
  { src = "nvim-mini/mini.icons" },
  { src = "nvim-mini/mini.notify" },
  { src = "nvim-mini/mini.pick" },
  { src = "nvim-mini/mini.splitjoin" },
  { src = "nvim-mini/mini.statusline" },
  { src = "nvim-mini/mini.tabline" },
})

vim.notify = require("mini.notify").make_notify()
