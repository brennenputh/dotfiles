local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"rcarriga/nvim-dap-ui",
		"ldelossa/nvim-dap-projects",
	},
	lazy = true,
	config = function()
		local mason_dap = require("mason-nvim-dap")

		mason_dap.setup({
			ensure_installed = {
				"codelldb",
				"python",
			},
		})

		require("nvim-dap-projects").search_project_config()

		-- The code below should go in a .nvim-dap.lua as relevant to the project at hand.
		--[[
    local dap = require("dap")

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
          return vim.fn.getcwd() .. "/path/to/exec"
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp

    dap.configurations.rust = {
      {
        name = "Rust Debug",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.getcwd() .. "/path/to/exec"
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    dap.adapters.python = {
      type = "executable",
      command = "/usr/bin/python",
      args = {"-m", "debugpy.adapter"}
    }

    dap.configurations.python = {
      {
        name = "Run Current File",
        type = "python",
        request = "launch",
        program = "${file}",
        pythonPath = "python",
        cwd = "${workspaceFolder}"
      }
    }
    --]]
	end,
}

return M
