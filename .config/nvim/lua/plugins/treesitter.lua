local parsers = {
  "css",
  "go",
  "json",
  "html",
  "lua",
  "markdown",
  "svelte",
  "tsx",
  "typescript",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then
      return
    end

    -- check if parser exists and load it
    if not vim.treesitter.language.add(language) then
      return
    end

    -- enables syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)

    -- enables treesitter based indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("lukeramljak/treesitter_updated", { clear = true }),
  desc = "Update TS parsers when updating plugin",
  ---@param event {data: {kind: "install" | "update" | "delete", path: string, spec: vim.pack.Spec}}
  callback = function(event)
    if event.data.spec.name == "nvim-treesitter" and event.data.kind == "update" then
      vim.schedule(function()
        vim.cmd("TSUpdate")
      end)
    end
  end,
})

require("treesitter-context").setup({
  -- Avoid the sticky context from growing a lot
  max_lines = 3,
  -- Match the context lines to the source code
  multiline_threshold = 1,
  -- Disable it when the window is too small
  min_window_height = 20,
})
