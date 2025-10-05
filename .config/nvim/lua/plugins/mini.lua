vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.ai").setup()
require("mini.bufremove").setup()
require("mini.completion").setup()
require("mini.diff").setup()
require("mini.extra").setup()
require("mini.files").setup({
  mappings = {
    show_help = "?",
    go_in_plus = "<cr>",
    go_out_plus = "<tab>",
  },
  windows = { width_nofocus = 25 },
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

vim.keymap.set("n", "<leader>bd", "<cmd>lua MiniBufremove.delete(0, false)<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "gd", "<cmd>Pick lsp scope='definition'<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fd", "<cmd>Pick diagnostic<cr>", { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<cr>", { desc = "Find help" })
vim.keymap.set("n", "<leader>fk", "<cmd>Pick keymaps<cr>", { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fs", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = "Find document symbols" })
vim.keymap.set("n", "<leader>fS", "<cmd>Pick lsp scope='workspace_symbol'<cr>", { desc = "Find workspace symbols" })
vim.keymap.set("n", "<leader>gw", "<cmd>Pick grep pattern=vim.fn.expand('<cword>')<cr>", { desc = "Grep current word" })

-- Files
vim.keymap.set("n", "<leader>e", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
  MiniFiles.reveal_cwd()
end, { desc = "Open Mini Files" })
