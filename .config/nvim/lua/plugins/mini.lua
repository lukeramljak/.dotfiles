require("mini.ai").setup()
require("mini.bufremove").setup()
require("mini.completion").setup()
require("mini.icons").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()

vim.notify = MiniNotify.make_notify()

vim.keymap.set("n", "<leader>bd", "<cmd>lua MiniBufremove.delete(0, false)<cr>", { desc = "Delete buffer" })
