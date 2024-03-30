local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  lazy = true
}

function M.config()
  local dap = require("dap")
  local dapui = require("dapui")
  local mason_dap = require("mason-nvim-dap")

  mason_dap.setup({
    ensure_installed = {
      "codelldb",
      "python"
    }
  })

  dapui.setup()

  dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
      command = '/home/bagatelle/.local/share/nvim/mason/bin/codelldb',
      args = {"--port", "${port}"}
    }
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
  }

  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
end

return M
