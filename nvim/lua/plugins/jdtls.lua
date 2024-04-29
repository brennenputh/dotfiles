local M = {
	"mfussenegger/nvim-jdtls",
  lazy = true,
  ft = { "java" },
	dependencies = {
		"neovim/nvim-lspconfig",
	},
}

function M.config()
	local mason_registry = require("mason-registry")
	local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()

	local config = {
		cmd = { jdtls_path .. "/bin/jdtls" },
		root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	}
	require("jdtls").start_or_attach(config)
end

return M
