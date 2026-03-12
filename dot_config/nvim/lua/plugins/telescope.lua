local M = {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "truncate" },
			file_ignore_patterns = { ".git/", "node_modules" },
		},
	},
	config = function()
		require("telescope").load_extension("notify")
	end,
}

return M
