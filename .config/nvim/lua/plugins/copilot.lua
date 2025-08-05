return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  config = function()
    require("copilot").setup({
      keymaps = {
        accept = false,
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
      },
    })

    vim.keymap.set("i", "<Tab>", function()
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end, { desc = "Copilot Super Tab" })
  end,
}
