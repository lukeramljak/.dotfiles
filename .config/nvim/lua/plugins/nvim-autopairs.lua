local Rule = require("nvim-autopairs.rule")
local conds = require("nvim-autopairs.conds")
local npairs = require("nvim-autopairs")

npairs.setup()

-- Autoclosing angle-brackets
npairs.add_rule(Rule("<", ">", {
  -- Avoid conflicts with nvim-ts-autotag
  "-html",
  "-javascriptreact",
  "-typescriptreact",
}):with_pair(conds.before_regex("%a+:?:?$", 3)):with_move(function(opts)
  return opts.char == ">"
end))
