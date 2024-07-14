local M = {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
}

function M.config()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
    ensure_installed = {
      "markdown_inline"
    },
		sync_install = false,
    auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		autopairs = { enable = true },
	})
end

return M
