return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set('n', '<leader>f', '<cmd>Neotree filesystem reveal left<CR>')
		vim.keymap.set('n', '<leader>cf', '<cmd>Neotree close left<CR>')
	end
}
