vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.ai").setup()
require("mini.bufremove").setup()
require("mini.completion").setup()
require("mini.diff").setup()
require("mini.extra").setup()
require("mini.files").setup({
  mappings = {
    go_in_plus = "<cr>",
    synchronize = "<c-s>",
  },
  windows = {
    max_number = 3,
    preview = true,
    width_nofocus = math.floor((vim.o.columns - 5) * 0.25), -- 25% of screen minus border+padding
    width_focus = math.floor((vim.o.columns - 5) * 0.25), -- 25% of screen minus border+padding
    width_preview = math.floor((vim.o.columns - 3) * 0.5), -- 50% of screen minus border+padding,
  },
})
require("mini.git").setup()
require("mini.icons").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.pick").setup({
  options = {
    content_from_bottom = true,
  },
  mappings = {
    marked_to_quickfix = {
      char = "<C-q>",
      func = function()
        local items = MiniPick.get_picker_matches().marked or {}
        MiniPick.default_choose_marked(items)
        MiniPick.stop()
      end,
    },
    all_to_quickfix = {
      char = "<A-q>",
      func = function()
        local matched_items = MiniPick.get_picker_matches().all or {}
        MiniPick.default_choose_marked(matched_items)
        MiniPick.stop()
      end,
    },
  },
})
require("mini.statusline").setup()
require("mini.tabline").setup()

vim.notify = MiniNotify.make_notify()

vim.keymap.set("n", "<leader>bd", function()
  MiniBufremove.delete()
end, { desc = "Delete buffer" })

vim.keymap.set("n", "gd", function()
  MiniExtra.pickers.lsp({ scope = "definition" })
end)

vim.keymap.set("n", "<leader>ff", function()
  MiniPick.builtin.files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>/", function()
  MiniPick.builtin.grep_live()
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fd", function()
  MiniExtra.pickers.diagnostic()
end, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fh", function()
  MiniPick.builtin.help()
end, { desc = "Find help" })
vim.keymap.set("n", "<leader>fk", function()
  MiniExtra.pickers.keymaps()
end, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fs", function()
  MiniExtra.pickers.lsp({ scope = "document_symbol" })
end, { desc = "Find document symbols" })
vim.keymap.set("n", "<leader>fS", function()
  MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
end, { desc = "Find workspace symbols" })
vim.keymap.set("n", "<leader>gw", function()
  MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Grep current word" })

-- Files
vim.keymap.set("n", "<leader>e", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
  MiniFiles.reveal_cwd()
end, { desc = "Open Mini Files" })
