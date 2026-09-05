--- Defer to vtsls in Svelte projects.
---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    if vim.fs.root(bufnr, { "svelte.config.js", "svelte.config.ts" }) then
      return
    end

    local root_markers = { { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lock" }, { ".git" } }
    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
    on_dir(project_root)
  end,
}
