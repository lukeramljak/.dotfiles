---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'catppuccin',
  statusline = {
    theme = "default",
    separator_style = "round"
  }
}
M.mappings = require 'custom.mappings'
M.plugins = 'custom.plugins'
return M
