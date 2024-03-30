local M = {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	dependencies = {
		"williamboman/mason.nvim",
		"zapling/mason-conform.nvim",
	},
}

function M.config()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			-- Scripting Languages
			lua = { "stylua" },
			python = { "black" },

			-- Web Languages
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },

			-- Compiled Languages
			rust = { "rustfmt" },
			cpp = { "clang-format" },

			-- JVM Languages
			java = { "google-java-format" },
			kotlin = { "ktlint" },

			-- Data Languages
			json = { "jq" },
		},
	})

	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

	-- Ensure formatters are installed
	require("mason-conform").setup()
end

return M
