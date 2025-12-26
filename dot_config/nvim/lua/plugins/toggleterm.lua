local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		local status_ok, toggleterm = pcall(require, "toggleterm")
		if not status_ok then
			return
		end

		toggleterm.setup({
			size = function()
				return vim.o.columns * 0.4
			end,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = "fish",
      float_opts = {
        border = "curved"
      }
		})
	end,
}

return M
