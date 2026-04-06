local misc_icons = require("icons").misc

require("blink.cmp").setup({
  keymap = {
    ["<CR>"] = { "accept", "fallback" },
    ["<C-\\>"] = { "hide", "fallback" },
    ["<C-n>"] = { "select_next", "show" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<C-p>"] = { "select_prev" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },
  completion = {
    list = {
      -- Insert items while navigating the completion list
      selection = { preselect = false, auto_insert = true },
    },
    documentation = {
      auto_show = true,
    },
    menu = {
      scrollbar = false,
      draw = {
        gap = 2,
        columns = {
          { "kind_icon", "kind", gap = 1 },
          { "label", "label_description", gap = 1 },
        },
      },
    },
  },
  cmdline = { enabled = false },
})

require("blink.indent").setup({
  static = {
    char = misc_icons.vertical_bar,
  },
  scope = {
    char = misc_icons.vertical_bar,
    highlights = { "BlinkIndent" },
  },
})

vim.api.nvim_create_autocmd("PackChanged", {
  pattern = "blink.cmp",
  group = vim.api.nvim_create_augroup("lukeramljak/blink_updated", { clear = true }),
  ---@param event {data: {kind: "install" | "update" | "delete", path: string, spec: vim.pack.Spec}}
  callback = function(event)
    if event.data.kind == "update" then
      -- Recommended way to access plugin files inside `PackChanged` event
      -- vim.cmd [[packadd blink.cmp]]
      vim.cmd.packadd({ args = { event.data.spec.name }, bang = false })
      -- Build the plugin from source
      -- vim.cmd [[BlinkCmp build]]
      require("blink.cmp.fuzzy.build").build()
    end
  end,
})
