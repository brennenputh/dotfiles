local M = {
	"rcarriga/nvim-dap-ui",
	lazy = true,
}

function M.config()
	local dap = require("dap")
	local dapui = require("dapui")
	dapui.setup()

	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
		require("nvim-tree.api").tree.close()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
		require("nvim-tree.api").tree.close()
	end
end

return M
