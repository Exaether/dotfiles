return {
	"andweeb/presence.nvim",
	config = function()
		require("presence").setup({
			-- General options
			auto_update = true,
			neovim_image_text = "Never Gonna Give You Up",
			main_image = "file", -- Main image display (either "neovim" or "file")
			-- client_id           = "793271441293967371", -- Use your own Discord application client id (not recommended)
			log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
			debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
			enable_line_number = false,
			blacklist = {},
			buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
			file_assets = {},
			show_time = true,

			-- Rich Presence text options
			editing_text = "Editing",
			file_explorer = "Browsing", -- file_explorer_text  = "Browsing %s",
			git_commit_text = "Committing changes",
			plugin_manager_text = "Managing plugins",
			reading_text = "Reading",
			workspace_text = "Working on a project", -- "Working on %s",
			line_number_text = "Line %s out of %s",
		})
	end,
}
