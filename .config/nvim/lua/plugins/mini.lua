vim.pack.add({ "https://github.com/echasnovski/mini.nvim" })

require("mini.diff").setup({
  view = {
    style = "sign",
    signs = {
      add = "▎",
      change = "▎",
      delete = "",
    },
  },
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

require("mini.icons").setup()

local notify = require("mini.notify")
notify.setup()
vim.notify = notify.make_notify()

require("mini.pairs").setup()

require("mini.pick").setup()
vim.keymap.set("n", "<leader>f", ":Pick files<cr>")
vim.keymap.set("n", "<leader>h", ":Pick help<cr>")
vim.keymap.set("n", "<leader>/", ":Pick grep_live<cr>")

require("mini.statusline").setup()

require("mini.tabline").setup()
