vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/projekt0n/github-nvim-theme" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/tpope/vim-fugitive" },
}, { load = true })

require("conform").setup({
	formatters_by_ft = {
		json = { "prettierd" },
		lua = { "stylua" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
	},
	format_on_save = function(bufnr)
		local disable_filetypes = { c = true, cpp = true, javascript = true }
		if disable_filetypes[vim.bo[bufnr].filetype] then
			return nil
		else
			return { timeout_ms = 500, lsp_format = "fallback" }
		end
	end,
})
require("mason").setup()
require("mini.ai").setup()
require("mini.diff").setup()
require("mini.icons").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.pick").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()
require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "json", "lua", "markdown", "tsx", "typescript" },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})
require("treesitter-context").setup({ max_lines = 3 })
