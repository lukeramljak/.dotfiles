vim.lsp.enable({ "copilot", "eslint", "gopls", "lua_ls", "tailwindcss", "vtsls" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local bufnr = ev.buf
		local methods = vim.lsp.protocol.Methods

		if not client then
			return
		end

		-- if client:supports_method(methods.textDocument_completion) then
		-- 	-- trigger completion on every keypress
		-- 	local chars = {}
		-- 	for i = 32, 126 do
		-- 		table.insert(chars, string.char(i))
		-- 	end
		-- 	client.server_capabilities.completionProvider.triggerCharacters = chars
		--
		-- 	vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
		-- 	vim.o.completeopt = "fuzzy,menuone,noselect,popup"
		-- 	vim.keymap.set("i", "<C-Space>", function()
		-- 		vim.lsp.completion.get()
		-- 	end)
		-- end

		-- Enable LLM-based inline completion
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion) then
			vim.o.completeopt = "menu,menuone,noinsert,fuzzy,popup"
			vim.lsp.inline_completion.enable(true)
			vim.keymap.set("i", "<Tab>", function()
				if not vim.lsp.inline_completion.get() then
					return "<Tab>"
				end
			end, {
				expr = true,
				replace_keycodes = true,
				desc = "Get the current inline completion",
			})
		end

		if client:supports_method(methods.textDocument_formatting) then
			vim.keymap.set("n", "<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, { buffer = bufnr, desc = "Format current buffer" })
		end

		if client:supports_method(methods.textDocument_documentHighlight) then
			local under_cursor_highlights_group =
				vim.api.nvim_create_augroup("user_cursor_highlights", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
				group = under_cursor_highlights_group,
				desc = "Highlight references under the cursor",
				buffer = bufnr,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
				group = under_cursor_highlights_group,
				desc = "Clear highlight references",
				buffer = bufnr,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})
