MODE = 0


local function fetch_bin_name(dir)
	local f = io.popen("ls -a \"" .. dir .. "/bin/\"")
	if f then
		local i = 0
		local bin_name = nil
		for bin_file in f:lines() do
			i = i + 1
			if i < 3 then
				goto continue
			end
			bin_name = bin_file
			if MODE ~= 0 and string.match(bin_name, "-test$") ~= nil then
				break
			elseif MODE == 0 and string.match(bin_name, "-test$") == nil and string.match(bin_name, ".a$") == nil and string.match(bin_name, ".dll$") == nil and string.match(bin_name, ".lib$") == nil then
				break
			end
			::continue::
		end
		f:close()
		if not bin_name then
			return nil
		else
			return dir .. "/bin/" .. bin_name
		end
	else
		return nil
	end
end


local function get_bin_name(dir)
	local cwd = vim.fn.getcwd()
	local bin_name = fetch_bin_name(cwd)
	if bin_name then
		return bin_name
	else
		return vim.fn.input('Path to executable: ', cwd .. '/bin/', 'file')
	end
end


local function switch_mode()
	if MODE == 0 then
		MODE = 1
		print("Switched the debugging tool to test mode. Binary executable: '" .. get_bin_name(vim.fn.getcwd()) .. "'.")
	else
		MODE = 0
		print("Switched the debugging tool to normal mode. Binary executable: '" .. get_bin_name(vim.fn.getcwd()) .. "'.")
	end
end


return {
	{
		"skywind3000/asyncrun.vim",
		dependencies = {
			"preservim/vimux",
		},
		config = function()
			local async_options = "AsyncRun -mode=term -pos=tmux"
			vim.keymap.set("n", "<leader>ee", "<cmd>" .. async_options .. " make all run<CR>")
			vim.keymap.set("n", "<leader>ex", "<cmd>" .. async_options .. " make clean all run<CR>")
			vim.keymap.set("n", "<leader>ec", "<cmd>" .. async_options .. " make clean all<CR>")
			vim.keymap.set("n", "<leader>ed", "<cmd>" .. async_options .. " make clean debug<CR>")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui"
		},
		config = function()
			local dap = require("dap")

			vim.keymap.set("n", "<leader>ds", switch_mode, {})

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
			vim.keymap.set("n", "<leader>di", dap.step_into, {})
			vim.keymap.set("n", "<leader>dn", dap.step_over, {})
			vim.keymap.set("n", "<leader>do", dap.step_out, {})
			vim.keymap.set("n", "<leader>dr", dap.repl.open, {})
			vim.keymap.set("n", "<leader>dt", dap.terminate, {})
			vim.keymap.set("n", "<leader>dl", dap.list_breakpoints, {})

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "-i", "dap" }
			}

			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = get_bin_name,
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
			}

			dap.configurations.cpp = dap.configurations.c

			local dapui = require("dapui")

			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	}
}
