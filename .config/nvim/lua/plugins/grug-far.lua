require("grug-far").setup({
  folding = { enabled = false },
  -- Don't numerate the result list
  resultLocation = { showNumberLabel = false },
})

vim.keymap.set({ "n", "v" }, "<leader>cg", function()
  local grug = require("grug-far")
  grug.open({ transient = true })
end, { desc = "GrugFar" })
