local M = {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			lazy = false,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			lazy = false,
		},
	},
	opts = {},
}

return M
