return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				-- styles = { transparency = true },
				-- highlight_groups = {
				-- 	TelescopeBorder = { fg = "highlight_high", bg = "none" },
				-- 	TelescopeNormal = { bg = "none" },
				-- 	TelescopePromptNormal = { bg = "base" },
				-- 	TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				-- 	TelescopeSelection = { fg = "text", bg = "base" },
				-- 	TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
				-- },
			})
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				vim.cmd.colorscheme("catppuccin"),
				integrations = {
					aerial = true,
					alpha = true,
					cmp = true,
					dashboard = true,
					flash = true,
					gitsigns = true,
					harpoon = true,
					headlines = true,
					illuminate = true,
					indent_blankline = { enabled = true },
					leap = true,
					lsp_trouble = true,
					mason = true,
					markdown = true,
					mini = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					navic = { enabled = true, custom_bg = "lualine" },
					neotest = true,
					neotree = true,
					noice = true,
					notify = true,
					semantic_tokens = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					which_key = true,
				},
			})
		end,
	},
}
