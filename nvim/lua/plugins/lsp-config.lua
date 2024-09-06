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
					-- "clang-format",
					"clangd",
					"cmake",
					"csharp_ls",
					"cssls",
					"html",
					"intelephense",
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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			capabilities.offsetEncoding = "utf-8"

			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.csharp_ls.setup({ capabilities = capabilities })
			lspconfig.cmake.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.texlab.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.autotools_ls.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.intelephense.setup({ capabilities = capabilities })
			lspconfig.basedpyright.setup({ capabilities = capabilities })
			lspconfig.r_language_server.setup({ capabilities = capabilities })
			lspconfig.sqlls.setup({ capabilities = capabilities })
			lspconfig.taplo.setup({ capabilities = capabilities })
			lspconfig.lemminx.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })

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
