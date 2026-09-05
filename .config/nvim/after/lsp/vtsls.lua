--- Only activate in Svelte projects. tsc handles everything else.

local jsts_settings = {
  suggest = { completeFunctionCalls = true },
  inlayHints = {
    functionLikeReturnTypes = { enabled = true },
    parameterNames = { enabled = "literals" },
    variableTypes = { enabled = true },
  },
  referencesCodeLens = {
    enabled = true,
    showOnAllFunctions = true,
  },
  implementationsCodeLens = {
    enabled = true,
    showOnInterfaceMethods = true,
    showOnAllClassMethods = true,
  },
}

---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
    root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
      or vim.list_extend(root_markers, { ".git" })

    if vim.fs.root(bufnr, { "deno.json", "deno.jsonc", "deno.lock" }) then
      return
    end

    if not vim.fs.root(bufnr, { "svelte.config.js", "svelte.config.ts" }) then
      return
    end

    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
    on_dir(project_root)
  end,
  settings = {
    typescript = jsts_settings,
    javascript = jsts_settings,
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
      preferences = {
        importModuleSpecifier = "non-relative",
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
}
