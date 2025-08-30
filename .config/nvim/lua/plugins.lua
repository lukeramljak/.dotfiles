vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/projekt0n/github-nvim-theme",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/tpope/vim-fugitive",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
}, { load = true })

require("conform").setup({
	formatters_by_ft = {
		go = { "gofmt", "goimports" },
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

require("fzf-lua").setup({
	keymap = {
		fzf = {
			["ctrl-q"] = "select-all+accept",
		},
	},
})

require("mini.ai").setup()
require("mini.completion").setup()
require("mini.diff").setup()
require("mini.icons").setup()
require("mini.notify").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "json", "lua", "markdown", "tsx", "typescript" },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})
require("treesitter-context").setup({ max_lines = 3 })
