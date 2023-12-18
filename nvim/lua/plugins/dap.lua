local M = {
  "mfussenegger/nvim-dap",
  lazy = false,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      lazy = false
    }
  }
}

function M.config()
  local dap = require "dap"

  local dap_ui_status_ok, dapui = pcall(require, "dapui")
  if not dap_ui_status_ok then
    return
  end

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
end

return M
