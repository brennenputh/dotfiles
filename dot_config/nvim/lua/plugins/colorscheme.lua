local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("catppuccin").setup({
			flavour = "frappe", -- latte, frappe, macchiato, mocha
			-- flavour = "auto" -- will respect terminal's background
			background = { -- :h background
				light = "latte",
				dark = "frappe",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.05, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			color_overrides = {
			},
			custom_highlights = {},
			auto_integrations = true,
		})

    -- Don't show end of buffer doesn't work right now, temporary solution below.
    vim.wo.fillchars='eob: '

		vim.cmd.colorscheme("catppuccin")
	end,
}

return M
