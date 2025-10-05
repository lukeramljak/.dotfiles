local function gh(url)
  return "https://github.com/" .. url
end

vim.pack.add({
  gh("stevearc/conform.nvim"),
  gh("lukas-reineke/indent-blankline.nvim"),
  gh("nvim-mini/mini.nvim"),
  gh("christoomey/vim-tmux-navigator"),
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
