return {
	-- "rose-pine/neovim",
	-- name = "rose-pine",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("rose-pine").setup({
	-- 		-- styles = { transparency = true },
	-- 		-- highlight_groups = {
	-- 		-- 	TelescopeBorder = { fg = "highlight_high", bg = "none" },
	-- 		-- 	TelescopeNormal = { bg = "none" },
	-- 		-- 	TelescopePromptNormal = { bg = "base" },
	-- 		-- 	TelescopeResultsNormal = { fg = "subtle", bg = "none" },
	-- 		-- 	TelescopeSelection = { fg = "text", bg = "base" },
	-- 		-- 	TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	-- 		-- },
	-- 	})
	-- 	vim.cmd("colorscheme rose-pine")
	-- end,
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				vim.cmd.colorscheme("catppuccin"),
			})
		end,
	},
}
