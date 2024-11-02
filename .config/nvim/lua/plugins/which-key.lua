return {
	{
		"folke/which-key.nvim",
		cmd = "WhichKey",
		opts = {
			defaults = {},
			spec = {
				mode = { "n", "v" },
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>g", group = "git" },
				{ "<leader>h", group = "hunks" },
				{ "<leader>s", group = "search" },
				{ "<leader>x", group = "diagnostics" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps (which-key)",
			},
			{
				"<c-w><space>",
				function()
					require("which-key").show({ keys = "<c-w>", loop = true })
				end,
				desc = "Window Hydra Mode (which-key)",
			},
		},
	},
}
