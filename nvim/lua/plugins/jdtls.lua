local M = {
	"mfussenegger/nvim-jdtls",
	lazy = false,
	dependencies = {
		"neovim/nvim-lspconfig",
	},
}

function M.config()
	local config = {
		cmd = { "$HOME/.local/share/nvim/mason/packages/jdt-language-server/bin/jdtls" },
		root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	}
	require("jdtls").start_or_attach(config)
end

return M
