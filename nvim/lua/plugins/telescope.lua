local M = {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	commit = "6213322",
	event = "Bufenter",
	cmd = { "Telescope" },
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
			lazy = true,
    },
	},
}

M.opts = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "truncate" },
		file_ignore_patterns = { ".git/", "node_modules" },
	},
}

function M.config()
end

return M
