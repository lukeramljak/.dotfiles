vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/folke/ts-comments.nvim" },
})

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  auto_install = true,
  ensure_installed = {
    "bash",
    "css",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "python",
    "regex",
    "tsx",
    "sql",
    "toml",
    "typescript",
    "xml",
    "yaml",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
  },
})

require("treesitter-context").setup({
  max_lines = 3,
  mode = "cursor",
})

require("nvim-ts-autotag").setup()

require("ts-comments").setup()

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Handle nvim-treesitter updates",
  group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
  callback = function(event)
    if event.data.kind == "update" then
      vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, "TSUpdate")
      if ok then
        vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
      else
        vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
      end
    end
  end,
})
