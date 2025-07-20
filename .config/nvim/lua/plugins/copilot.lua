return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  config = function()
    Snacks.toggle({
      name = "GitHub Copilot",
      get = function()
        if not vim.g.copilot_enabled then -- HACK: since it's disabled by default the below will throw error
          return false
        end
        return not require("copilot.client").is_disabled()
      end,
      set = function(state)
        if state then
          require("copilot").setup() -- setting up for the very first time
          require("copilot.command").enable()
          vim.g.copilot_enabled = true
        else
          require("copilot.command").disable()
          vim.g.copilot_enabled = false
        end
      end,
    }):map("<leader>ux")
  end,
  opts = {
    suggestion = {
      enabled = false,
      auto_trigger = true,
      keymap = {
        accept = false,
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
