return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local none_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			local lsp_formatting = function(bufnr)
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
					async = false,
					options = require("formatting"),
					bufnr = bufnr,
				})
			end

			none_ls.setup({
				debug = true,
				sources = {
					-- C/C++
					none_ls.builtins.formatting.clang_format.with({
						-- NOTE : do not add double quotes around the clang format file path
						extra_args = { '-style=file:/home/salamint/.config/nvim/.clang-format' }
					}),

					-- Lua
					none_ls.builtins.formatting.stylua,

					-- Python
					none_ls.builtins.formatting.black,
					none_ls.builtins.diagnostics.mypy,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								lsp_formatting(bufnr)
							end
						})
					end
				end
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		config = function()
			local code_runner = require("code_runner")
			vim.keymap.set("n", "<A-e>", "<cmd>RunProject<CR>", { noremap = true, silent = false })
		end
	}
}
