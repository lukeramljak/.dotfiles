-- Install with: npm i -g typescript@7

---@type vim.lsp.Config
return {
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = {
          enabled = "literals",
          suppressWhenArgumentMatchesName = true,
        },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
  cmd = { "tsc", "--lsp", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = function(bufnr, on_dir)
    -- Defer to vtsls in Svelte projects.
    if vim.fs.root(bufnr, { "svelte.config.js", "svelte.config.ts" }) then
      return
    end

    local root_markers = { { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lock" }, { ".git" } }

    -- Fallback to the current working directory if no project root is found.
    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

    on_dir(project_root)
  end,
}
