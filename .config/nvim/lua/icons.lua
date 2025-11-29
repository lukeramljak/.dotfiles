local M = {}

M.diagnostics = {
  ERROR = "",
  WARN = "",
  HINT = "",
  INFO = "",
}

M.arrows = {
  right = "",
  left = "",
  up = "",
  down = "",
}

M.symbol_kinds = {
    Array = '󰅪',
    Class = '',
    Color = '󰏘',
    Constant = '󰏿',
    Constructor = '',
    Enum = '',
    EnumMember = '',
    Event = '',
    Field = '󰜢',
    File = '󰈙',
    Folder = '󰉋',
    Function = '󰆧',
    Interface = '',
    Keyword = '󰌋',
    Method = '󰆧',
    Module = '',
    Operator = '󰆕',
    Property = '󰜢',
    Reference = '󰈇',
    Snippet = '',
    Struct = '',
    Text = '',
    TypeParameter = '',
    Unit = '',
    Value = '',
    Variable = '󰀫',
}

M.misc = {
  bug = "",
  dashed_bar = "┊",
  ellipsis = "…",
  git = "",
  palette = "󰏘",
  robot = "󰚩",
  search = "",
  terminal = "",
  toolbox = "󰦬",
  vertical_bar = "│",
}

return M
