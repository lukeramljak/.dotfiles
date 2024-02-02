return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			user_default_options = {
				names = false,
				css = true,
				tailwind = true,
			},
			filetypes = {
				css = { names = true },
			},
		})
	end,
}
