local diagnostic_icons = require("icons").diagnostics

vim.lsp.enable({
  "biome",
  "cssls",
  "dprint",
  "eslint",
  "gopls",
  "html",
  "lua_ls",
  "svelte",
  "tailwindcss",
  -- "tsgo",
  "vtsls",
})

vim.lsp.config("cssls", {
  settings = {
    css = { validate = true, lint = { unknownAtRules = "ignore" } },
  },
})

vim.lsp.config("vtsls", {
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        maxInlayHintLength = 30,
        completion = {
          enableServerSideFuzzyMatch = true,
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
          importModuleSpecifier = "non-relative",
        },
      },
      tsserver = {
        globalPlugins = {
          {
            name = "typescript-svelte-plugin",
            location = "~/.local/share/mise/installs/npm-typescript-svelte-plugin/latest/lib/node_modules/typescript-svelte-plugin",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },
})

vim.diagnostic.config({
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = false,
  virtual_text = { spacing = 2 },
  float = {
    source = "if_many",
    -- Show severity icons as prefixes
    prefix = function(diag)
      local level = vim.diagnostic.severity[diag.severity]
      local prefix = string.format(" %s ", diagnostic_icons[level])
      return prefix, "Diagnostic" .. level:gsub("^%l", string.upper)
    end,
  },
})
