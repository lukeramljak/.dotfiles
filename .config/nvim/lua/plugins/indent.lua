local misc_icons = require("icons").misc

require("blink.indent").setup({
  static = {
    char = misc_icons.vertical_bar,
  },
  scope = {
    char = misc_icons.vertical_bar,
    highlights = { "BlinkIndent" },
  },
})
