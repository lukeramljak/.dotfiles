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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf
    local methods = vim.lsp.protocol.Methods

    if not client then
      return
    end

    if client:supports_method(methods.textDocument_formatting) then
      vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
      end, { buffer = bufnr, desc = "Format current buffer" })
    end

    if client:supports_method(methods.textDocument_documentHighlight) then
      local under_cursor_highlights_group =
        vim.api.nvim_create_augroup("lukeramljak/cursor_highlights", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
        group = under_cursor_highlights_group,
        desc = "Highlight references under the cursor",
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
        group = under_cursor_highlights_group,
        desc = "Clear highlight references",
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
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
