-- Enables vim's treesitter.  The pcall is just in case nvim-treesitter hasn't installed the parser.
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ctx)
		local bo = vim.bo[ctx.buf]
		if bo.readonly or bo.buftype ~= "" then
			return
		end

		if not pcall(vim.treesitter.start) then
			vim.notify("No treesitter parser installed for this filetype.")
		end
	end,
})

-- Source: https://github.com/chrisgrieser/.config/blob/1491919ae00343d1d29b4e4f9c2b82d329062a63/nvim/lua/config/autocmds.lua#L28-L46
vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
	desc = "Auto-save on relevant events.",
	callback = function(ctx)
		local bufnr = ctx.buf
		local bo = vim.bo[bufnr]
		local b = vim.b[bufnr]
		if bo.buftype ~= "" or bo.ft == "gitcommit" or bo.readonly then
			return
		end
		if b.saveQueued and ctx.event ~= "FocusLost" then
			return
		end

		local debounce = ctx.event == "FocusLost" and 0 or 2000 -- save at once on focus loss
		b.saveQueued = true
		vim.defer_fn(function()
			if not vim.api.nvim_buf_is_valid(bufnr) then
				return
			end
			-- `noautocmd` prevents weird cursor movement
			vim.api.nvim_buf_call(bufnr, function()
				vim.cmd("silent! noautocmd lockmarks update!")
			end)
			b.saveQueued = false
		end, debounce)
	end,
})

-- Enable word wrap for text documents

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "plaintex", "tex", "asciidoc" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
	end,
})

-- Don't Display Line Numbers On Small Windows

local set_numbers = function(value, window)
	vim.api.nvim_set_option_value("number", value, { win = window })
end
local window_size_threshold = 40

vim.api.nvim_create_autocmd("WinResized", {
	callback = function(ctx)
		local bufnr = ctx.buf
		local bo = vim.bo[bufnr]
		if bo.buftype ~= "" or bo.ft == "gitcommit" or bo.buftype == "terminal" or bo.bt ~= "" or bo.readonly then
			return
		end
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local width = vim.api.nvim_win_get_width(win)
			if width < window_size_threshold then
				set_numbers(false, win)
			else
				set_numbers(true, win)
			end
		end
	end,
})
