return {
	{
		"stevearc/aerial.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				on_attach = function(bufnr)
					vim.keymap.set({ "n", "v" }, "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set({ "n", "v" }, "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
			vim.keymap.set("n", "<leader>ss", "<cmd>AerialToggle right<CR>")
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({
				keys = {
					["<"] = { escape = true, close = false, pair = "<>" },
					[">"] = { escape = true, close = false, pair = "<>" },
					["'"] = { escape = true, close = false, pair = "''" },
				},
				options = {
					pair_spaces = true,
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					offsets = {
						{
							filetype = "neo-tree",
							text = "Neo-tree",
							text_align = "center",
							separator = true,
						},
					},
				},
			})
		end,
	},
	{
		"sudormrfbin/cheatsheet.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		},
		config = function()
			require("codesnap").setup({
				bg_theme = "peach",
				code_font_family = "Hack Nerd Font",
				has_breadcrumbs = true,
				has_line_number = true,
				mac_window_bar = false,
				title = "CodeSnap.nvim",
				watermark = "",
				watermark_font_family = "Hack Nerd Font",
			})
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			local goto_preview = require("goto-preview")
			goto_preview.setup({
				width = 96,
				height = 24,
				default_mappings = false,
				debug = false,
				resizing_mappings = true,
				references = { telescope = require("telescope.themes").get_dropdown({ hide_preview = false }) },
				focus_on_open = true,
				preview_window_title = { enable = true, position = "center" },
			})

			vim.keymap.set("n", "<leader>sd", goto_preview.goto_preview_definition, {})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				indent = { char = "▏" },
				scope = {
					show_start = false,
					show_end = false,
				},
			})
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({ handle = { color = "#5c3d5c" } })
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},
}
