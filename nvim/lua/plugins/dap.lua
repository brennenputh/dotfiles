local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"rcarriga/nvim-dap-ui",
	},
	lazy = true,
}

function M.config()
	local dap = require("dap")
	local mason_dap = require("mason-nvim-dap")

	mason_dap.setup({
		ensure_installed = {
			"codelldb",
			"python",
		},
	})

	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = "/home/bagatelle/.local/share/nvim/mason/bin/codelldb",
			args = { "--port", "${port}" },
		},
	}

	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp
end

return M
