local snacks = require("snacks")

snacks.setup({
  explorer = { enabled = true },
  picker = {
    enabled = true,
    matcher = {
      frecency = true,
    },
  },
})

vim.keymap.set("n", "<leader>ft", function()
  snacks.explorer()
end, { desc = "File Tree" })

vim.keymap.set("n", "<leader>ff", function()
  snacks.picker.files()
end, { desc = "File Picker" })

vim.keymap.set("n", "<leader>/", function()
  snacks.picker.grep({ hidden = true })
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fd", function()
  snacks.picker.diagnostics()
end, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fh", function()
  snacks.picker.help()
end, { desc = "Find help" })
vim.keymap.set("n", "<leader>fk", function()
  snacks.picker.keymaps()
end, { desc = "Find keymaps" })

vim.keymap.set("n", "gd", function()
  snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function()
  snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })
vim.keymap.set("n", "grr", function()
  snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", function()
  snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function()
  snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "gai", function()
  snacks.picker.lsp_incoming_calls()
end, { desc = "C[a]lls Incoming" })
vim.keymap.set("n", "gao", function()
  snacks.picker.lsp_outgoing_calls()
end, { desc = "C[a]lls Outgoing" })
vim.keymap.set("n", "<leader>fs", function()
  snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>fS", function()
  snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })

vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]])
