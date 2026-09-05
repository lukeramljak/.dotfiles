---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      completion = { callSnippet = "Replace" },
      format = { enable = false },
      hint = {
        arrayIndex = "Disable",
      },
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
        },
      },
    },
  },
}
