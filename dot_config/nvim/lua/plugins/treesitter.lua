local M = {
	"nvim-treesitter/nvim-treesitter",
  lazy = false,
	branch = "main",
	dependencies = {
		"cathaysia/tree-sitter-asciidoc",
	},
	build = ":TSUpdate | TSInstall asciidoc asciidoc_inline query",
	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.setup({})
		treesitter.install({ "unstable" })
	end,
}

vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		local parser_config = require("nvim-treesitter.parsers")
		parser_config.asciidoc = {
			install_info = {
				url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
				files = { "tree-sitter-asciidoc/src/parser.c", "tree-sitter-asciidoc/src/scanner.c" },
        location = "tree-sitter-asciidoc",
				branch = "master",
				generate_requires_npm = false,
				requires_generate_from_grammar = false,
			},
		}
		parser_config.asciidoc_inline = {
			install_info = {
				url = "https://github.com/cathaysia/tree-sitter-asciidoc.git",
				files = { "tree-sitter-asciidoc_inline/src/parser.c", "tree-sitter-asciidoc_inline/src/scanner.c" },
        location = "tree-sitter-asciidoc_inline",
				branch = "master",
				generate_requires_npm = false,
				requires_generate_from_grammar = false,
			},
		}
	end,
})

return M
