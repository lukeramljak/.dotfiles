return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = { capabilities = capabilities },
      emmet_ls = {},
      html = { capabilities = capabilities },
      gopls = {},
      lua_ls = {
        on_init = function(client)
          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            workspace = { library = { vim.env.VIMRUNTIME } },
          })
        end,
        settings = { Lua = {} },
      },
      tailwindcss = {},
      vtsls = {
        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              importModuleSpecifier = "non-relative",
            },
          },
        },
      },
    },
  },
  inlay_hints = {
    enabled = true,
  },

  config = function(_, opts)
    for server, settings in pairs(opts.servers) do
      vim.lsp.config(server, settings)
      vim.lsp.enable(server)
    end
  end,
}
