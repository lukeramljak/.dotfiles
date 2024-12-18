local lsp = vim.lsp

--- @param cfg vim.lsp.Config
local function add(name, cfg)
  lsp.config(name, cfg)
  lsp.enable(name)
end

lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

add('css-lsp', {
  cmd = { 'vscode-css-languageserver', '--stdio' },
  filetypes = { 'css', 'scss', 'sass' },
})

add('emmet-ls', {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = {
    'html',
    'typescriptreact',
    'javascriptreact',
    'css',
    'sass',
    'scss',
  },
})

add('html-lsp', {
  cmd = { 'vscode-html-languageserver', '--stdio' },
  filetypes = { 'html' },
})

add('gopls', {
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unreachable = false,
      },
      staticcheck = true,
    },
  },
})

add('luals', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = { disable = { 'missing-fields' } },
      runtime = {
        version = 'LuaJIT',
      },
    },
  },
})

add('tailwindcss-language-server', {
  cmd = { 'tailwindcss-language-server' },
  filetypes = {
    'html',
    'css',
    'scss',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
  },
})

add('vtsls', {
  cmd = { 'vtsls', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
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
      updateImportsOnFileMove = { enabled = 'always' },
      suggest = {
        completeFunctionCalls = true,
      },
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = 'literals' },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        importModuleSpecifier = 'non-relative',
      },
    },
  },
})

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
end

map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

-- Change the Diagnostic symbols in the sign column (gutter)
local x = vim.diagnostic.severity
vim.diagnostic.config {
  signs = { text = { [x.ERROR] = '󰅙', [x.WARN] = '', [x.INFO] = '󰋼', [x.HINT] = '󰌵' } },
  underline = true,
  float = { border = 'single' },
}
