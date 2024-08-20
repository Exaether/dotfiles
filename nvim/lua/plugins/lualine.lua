return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local colors = require("colors")
		local b_bg = "#45475a"
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				theme = {
					normal = {
						a = { bg = colors.blue, fg = colors.crust, gui = "bold" },
						b = { bg = b_bg, fg = colors.text },
						c = { bg = colors.crust, fg = colors.text }
					},
					insert = {
						a = { bg = colors.green, fg = colors.crust, gui = "bold" },
						b = { bg = b_bg, fg = colors.text },
						c = { bg = colors.crust, fg = colors.text }
					},
					visual = {
						a = { bg = colors.mauve, fg = colors.crust, gui = "bold" },
						b = { bg = b_bg, fg = colors.text },
						c = { bg = colors.crust, fg = colors.text }
					},
					replace = {
						a = { bg = colors.red, fg = colors.crust, gui = "bold" },
						b = { bg = b_bg, fg = colors.text },
						c = { bg = colors.crust, fg = colors.text }
					},
					command = {
						a = { bg = colors.peach, fg = colors.crust, gui = "bold" },
						b = { bg = b_bg, fg = colors.text },
						c = { bg = colors.crust, fg = colors.text }
					},
					inactive = {
						a = { bg = colors.teal, fg = colors.crust, gui = "bold" },
						b = { bg = b_bg, fg = colors.text },
						c = { bg = colors.crust, fg = colors.text }
					}
				}
			}
		})
	end
}
