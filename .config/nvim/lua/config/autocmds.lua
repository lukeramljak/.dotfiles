local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("ts_imports", { clear = true }),
	pattern = { "*.tsx,*.ts" },
	callback = function()
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.organizeImports" },
				diagnostics = {},
			},
		})
	end,
})
