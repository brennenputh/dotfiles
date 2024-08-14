local M = {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = false })()
	end,
}

function M.config()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
    ensure_installed = "all",
		highlight = { enable = true },
		indent = { enable = true },
		autopairs = { enable = true },
	})
end

return M
