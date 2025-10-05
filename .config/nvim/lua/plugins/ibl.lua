local misc_icons = require("icons").misc

require("ibl").setup({
  indent = {
    char = misc_icons.vertical_bar,
    tab_char = misc_icons.vertical_bar,
  },
  scope = { show_start = false, show_end = false },
})
