local M = {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	dependencies = {
		"williamboman/mason.nvim",
		"zapling/mason-conform.nvim",
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Scripting Languages
				lua = { "stylua" },
				python = { "ruff_format", "ruff_optimize_imports", "ruff_fix" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				fish = { "fish_indent" },

				-- Web Languages
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
        php = { "pretty-php" },
        xml = { "xmllint" },

				-- Compiled Languages
				rust = { "rustfmt" },
				cpp = { "clang-format" },
        cmake = { "cmake_format" },
        zig = { "zigfmt" },

				-- JVM Languages
				java = { "google-java-format" },
				kotlin = { "ktlint" },

				-- Data Languages
				json = { "jq" },
				markdown = { "prettier" },
				yaml = { "yamlfix" },
        just = { "just" },
        latex = { "latexindent" },

        -- Databases
        sql = { "sqruff" },
			},
		})

		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		-- Ensure formatters are installed
		require("mason-conform").setup()
	end,
}

return M
