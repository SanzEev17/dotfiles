return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			style = "moon",
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			options = {
				styles = {
					comments = "italic",
				},
			},
		})

		vim.cmd("colorscheme tokyonight")
	end,
}
