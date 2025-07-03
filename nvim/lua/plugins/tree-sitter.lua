return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"asm",
					"bash", "bibtex",
					"c", "c_sharp", "cmake", "cpp", "css", "csv",
					"git_config", "gitcommit", "gitignore", "gpg",
					"html", "http", "twig",
					"ini",
					"java", "javascript", "json", "json5",
					"latex",
					"lua", "luadoc",
					"m68k", "make", "markdown",
					"nasm",
					"php", "phpdoc", "properties", "python",
					"r", "rasi", "regex", "requirements", "rust",
					"scss", "sql",
					"udev",
					"vim", "vimdoc",
					"xml",
					"yaml"
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true }
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 10,
				line_numbers = true
			})
		end
	}
}
