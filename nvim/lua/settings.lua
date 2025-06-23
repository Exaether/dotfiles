----------------------------------------------------
--                   VIM SETTINGS                 --
----------------------------------------------------

-- Tabulation settings
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = false

-- Search settings
vim.opt.ignorecase = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Editor config
vim.opt.syntax = "enable"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.wildmode = "longest,list"
vim.opt.wrap = true

-- Setting leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Other settings
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Custom keymaps
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")

-- Auto commands
local c_files = { "*.c", "*.cpp", "*.h", "*.hpp" }
vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
	pattern = c_files,
	command = 'silent!remove_object.py "<afile>"',
})

vim.keymap.set("n", "<M-%>", "<cmd>vsp<CR>")

vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "DapBreakpointSymbol",
	numhl = "DapBreakpoint",
})

vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "DapStoppedSymbol",
	numhl = "DapBreakpoint",
})
