-- Source: Reddit post.  If it ever breaks, get a new one.
vim.api.nvim_create_autocmd("ModeChanged", {
	desc = "Makes it so snippets don't mess up tab",
	pattern = "*",
	callback = function()
		if
			((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
			and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
			and not require("luasnip").session.jump_active
		then
			require("luasnip").unlink_current()
		end
	end,
})

-- Source: https://nanotipsforvim.prose.sh/automatically-set-the-cwd-without-rooter-plugin
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Change root directory when switching buffers",
	callback = function(ctx)
		local root = vim.fs.root(ctx.buf, {".git", "Makefile"})
		if root then vim.fn.chdir(root) end
	end,
})

-- Source: https://github.com/chrisgrieser/.config/blob/1491919ae00343d1d29b4e4f9c2b82d329062a63/nvim/lua/config/autocmds.lua#L28-L46
vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
  desc = "Auto-save on relevant events.",
	callback = function(ctx)
		local bufnr = ctx.buf
		local bo = vim.bo[bufnr]
		local b = vim.b[bufnr]
		if bo.buftype ~= "" or bo.ft == "gitcommit" or bo.readonly then return end
		if b.saveQueued and ctx.event ~= "FocusLost" then return end

		local debounce = ctx.event == "FocusLost" and 0 or 2000 -- save at once on focus loss
		b.saveQueued = true
		vim.defer_fn(function()
			if not vim.api.nvim_buf_is_valid(bufnr) then return end
			-- `noautocmd` prevents weird cursor movement
			vim.api.nvim_buf_call(bufnr, function() vim.cmd("silent! noautocmd lockmarks update!") end)
			b.saveQueued = false
		end, debounce)
	end,
})
