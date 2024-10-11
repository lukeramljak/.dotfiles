local cmp = require("cmp")

return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}
