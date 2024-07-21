return {
	"romgrk/barbar.nvim",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({
			animation = true,
			auto_hide = false,

			-- Enable/disable current/total tabpages indicator (top right corner)
			tabpages = true,
			clickable = true,

			-- Enable highlighting visible buffers
			highlight_visible = true,

			icons = {
				buffer_index = false,
				buffer_number = false,
				button = false,
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
					[vim.diagnostic.severity.WARN] = { enabled = true, icon = "" },
					[vim.diagnostic.severity.INFO] = { enabled = true, icon = "" },
					[vim.diagnostic.severity.HINT] = { enabled = true, icon = "" },
				},
				gitsigns = {
					added = { enabled = false, icon = "+" },
					changed = { enabled = false, icon = "~" },
					deleted = { enabled = false, icon = "-" },
				},

				filetype = {
					enabled = true,
				},

				separator = { left = "▎", right = "" },

				modified = { button = "●" },
				pinned = { button = "", filename = true },

				preset = "default",
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = false },
			},

			minimum_padding = 1,
			maximum_padding = 2,
			maximum_length = 20,
			minimum_length = 0,

			-- Set the filetypes which barbar will offset itself for
			sidebar_filetypes = {
				NvimTree = {
					event = "BufWinLeave",
					text = "File Explorer",
					align = "left",
				},
			},
			no_name_title = nil,
		})
	end,
}
