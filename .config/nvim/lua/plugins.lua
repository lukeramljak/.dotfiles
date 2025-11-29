local function gh(url)
  return "https://github.com/" .. url
end

vim.pack.add({
  gh("saghen/blink.indent"),
  gh("saghen/blink.cmp"),
  gh("stevearc/conform.nvim"),
  gh("sindrets/diffview.nvim"),
  gh("ibhagwan/fzf-lua"),
  gh("lewis6991/gitsigns.nvim"),
  gh("MagicDuck/grug-far.nvim"),
  gh("OXY2DEV/markview.nvim"),
  gh("nvim-mini/mini.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("windwp/nvim-autopairs"),
  gh("windwp/nvim-ts-autotag"),
  gh("stevearc/quicker.nvim"),
  gh("nvim-treesitter/nvim-treesitter-context"),
  { src = gh("catppuccin/nvim"), name = "catppuccin" },
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "master" },
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

vim.api.nvim_create_autocmd("PackChanged", {
  pattern = "blink.cmp",
  group = vim.api.nvim_create_augroup("lukeramljak/blink_updated", { clear = true }),
  ---@param event {data: {kind: "install" | "update" | "delete", path: string, spec: vim.pack.Spec}}
  callback = function(event)
    if event.data.kind == "update" then
      -- Recommended way to access plugin files inside `PackChanged` event
      -- vim.cmd [[packadd blink.cmp]]
      vim.cmd.packadd({ args = { event.data.spec.name }, bang = false })
      -- Build the plugin from source
      -- vim.cmd [[BlinkCmp build]]
      require("blink.cmp.fuzzy.build").build()
    end
  end,
})
