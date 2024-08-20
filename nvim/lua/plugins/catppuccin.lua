return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local colors = require("colors")
		local colorscheme = require("colorscheme")

		require("catppuccin").setup({
			color_overrides = { all = colors },
			custom_highlights = colorscheme,
			highlight_overrides = { all = colorscheme },
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15,
			},
			integrations = {
				alpha = true,
				gitsigns = true,
				mason = true,
				neotree = true,
				cmp = true,
				treesitter = true,
				telescope = { enabled = true },
			},
			show_end_of_buffer = true,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
