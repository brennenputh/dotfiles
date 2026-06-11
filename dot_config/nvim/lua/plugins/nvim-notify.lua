local M = {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
    require("notify").setup({
      stages = "slide",
    })
		vim.notify = require("notify")
	end,
}

return M
