return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		requires = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"autotools_ls",
					"basedpyright",
					"bashls",
					"black",
					"clang-format",
					"clangd",
					"cmake",
					"csharp_ls",
					"cssls",
					"html",
					-- "intelephense",
					"phpactor",
					"jdtls",
					"jsonls",
					"lemminx",
					"lua_ls",
					"marksman",
					"pylsp",
					"sqlls",
					"taplo",
					"texlab",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("bashls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("scharp_ls")
			vim.lsp.enable("cmake")
			vim.lsp.enable("cssls")
			vim.lsp.enable("html")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("jdtls")
			vim.lsp.enable("texlab")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("autotools_ls")
			vim.lsp.enable("marksman")
			vim.lsp.enable("phpactor")
			vim.lsp.enable("basedpyright")
			vim.lsp.enable("r_language_server")
			vim.lsp.enable("sqlls")
			vim.lsp.enable("taplo")
			vim.lsp.enable("lemminx")
			vim.lsp.enable("yamlls")
			vim.lsp.config['html']['filetypes'] = {'html', 'twig'}
		

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>df", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>su", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>hl", vim.lsp.buf.document_highlight, {})
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.clear_references, {})
		end,
	},
}
