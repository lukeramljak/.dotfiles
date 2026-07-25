local add = require("vim-pack").add

add({
  {
    src = "arborist-ts/arborist.nvim",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "caddy",
        "css",
        "fish",
        "gitcommit",
        "go",
        "html",
        "javascript",
        "json",
        "json5",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rasi",
        "regex",
        "rust",
        "scss",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },
})
