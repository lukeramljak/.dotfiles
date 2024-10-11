return {
  {
    "folke/noice.nvim",
    enabled = false,
    opts = {
      lsp = {
        hover = {
          silent = true,
        },
      },
      routes = {
        {
          opts = { skip = true },
          filter = {
            event = "lsp",
            find = "This command may require a client extension.",
          },
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 2, 3 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    },
  },
}
