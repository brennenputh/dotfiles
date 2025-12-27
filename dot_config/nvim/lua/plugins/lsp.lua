local M = {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
      --"pest-parser/pest.vim",
			{
				"williamboman/mason.nvim",
				lazy = false,
			},
		},
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities = cmp_nvim_lsp.default_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"superhtml",
				"jdtls",
				"jsonls",
				"lua_ls",
				"marksman",
				"openscad_lsp",
				"pest_ls",
				"pyright",
				"rust_analyzer",
				"texlab",
				"ts_ls",
				"vue_ls",
				"yamlls",
			},
			automatic_enable = {
				exclude = {
					"pest_ls",
				},
			},
		})

		-- require("pest-vim").setup({})

		vim.lsp.config("rust-analyzer", {
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
				},
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					format = {
						enable = false,
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		local mo_capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

		capabilities.workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		}

		vim.lsp.config("markdown_oxide", {
			capabilities = mo_capabilities,
		})

		vim.lsp.config("openscad_lsp", {
			settings = {
				openscad = {
					fmt_style = "Google",
				},
			},
		})
	end,
}

return M
