-- Shorten function name
local function keymap(mode, lhs, rhs, opts)
	local options = { silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local function wk_add(lead_keystroke, group_name)
	require("which-key").add({ lead_keystroke, group = group_name })
end

keymap("", "<Space>", "<Nop>")

--[[ NORMAL MODE ]]

-- Register Preservation for dd
vim.keymap.set("n", "dd", function()
	if vim.fn.getline(".") == "" then
		return '"_dd'
	end
	return "dd"
end, { expr = true })

-- Register preservation for x
vim.keymap.set("n", "x", '"_x')

-- Navigate Buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")
keymap("n", "<S-z>", "<cmd>Bdelete!<CR>")

-- Clear Highlights
keymap("n", "<Esc>", ":nohl<CR>:echo<CR>")

-- Quick Window Switching
keymap("n", "<C-h>", "<cmd>wincmd h<CR>")
keymap("n", "<C-j>", "<cmd>wincmd j<CR>")
keymap("n", "<C-k>", "<cmd>wincmd k<CR>")
keymap("n", "<C-l>", "<cmd>wincmd l<CR>")

-- Quick Window Resizing
local win_resize = function(win, amt, dir)
	return function()
		require("winresize").resize(win, amt, dir)
	end
end

local win_focus = function()
	require("dapui").close()
	require("nvim-tree.api").tree.close()

	local current_win = vim.api.nvim_get_current_win()
	local windows = vim.api.nvim_list_wins()
	vim.api.nvim_win_set_width(0, vim.o.columns - (#windows * 20))
	for _, win in ipairs(windows) do
		if win ~= current_win then
			vim.api.nvim_win_set_width(win, 20)
		end
	end
end

wk_add("<leader>r", "Window Resize")
keymap("n", "<leader>rh", win_resize(0, 10, "left"))
keymap("n", "<leader>rj", win_resize(0, 3, "down"))
keymap("n", "<leader>rk", win_resize(0, 3, "up"))
keymap("n", "<leader>rl", win_resize(0, 10, "right"))
keymap("n", "<leader>r=", "<C-w>=", { desc = "Equalize Windows" })
keymap("n", "<leader>rs", function()
	vim.api.nvim_win_set_width(0, 20)
end)
keymap("n", "<leader>rf", win_focus)

--[[ VISUAL MODE ]]

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Better Paste
keymap("v", "p", "P")

--[[ PLUGINS ]]

-- Telescope
wk_add("<leader>f", "Telescope")
local ts_builtin = require("telescope.builtin")
keymap("n", "<leader>ff", ts_builtin.find_files, { desc = "Find Files" })
keymap("n", "<leader>fr", ts_builtin.live_grep, { desc = "Ripgrep" })
keymap("n", "<leader>fb", function()
	require("telescope").extensions.notify.notify()
end, { desc = "Buffer Select" })

-- Integration: nvim-notify
keymap("n", "<leader>fn", ":Telescope notify<CR>", { desc = "Notifications" })

-- Close dap when nvim tree opens
local function tree_toggle()
	require("dapui").close()
	require("nvim-tree.api").tree.toggle()
end

-- nvim-tree
keymap("n", "<leader>e", tree_toggle, { desc = "Nvim Tree" })

-- nvim-chainsaw
wk_add("<leader>c", "Chainsaw")
keymap("n", "<leader>cv", function()
	require("chainsaw").variableLog()
end, { desc = "Log Variable" })
keymap("n", "<leader>co", function()
	require("chainsaw").objectLog()
end, { desc = "Log Object" })
keymap("n", "<leader>cs", function()
	require("chainsaw").stacktraceLog()
end, { desc = "Log Stacktrace of Call" })
keymap("n", "<leader>ce", function()
	require("chainsaw").emojiLog()
end, { desc = "Minimal Beep Log" })
keymap("n", "<leader>ct", function()
	require("chainsaw").timeLog()
end, { desc = "Log Time Duration" })
keymap("n", "<leader>cd", function()
	require("chainsaw").debugLog()
end, { desc = "Add Debug Statement" })
keymap("n", "<leader>cr", function()
	require("chainsaw").removeLogs()
end, { desc = "Remove Chainsaw Logs" })

-- LSP
wk_add("<leader>l", "LSP")
keymap("n", "<leader>lf", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format Code" })
keymap("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "Go to Declaration" })
keymap("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to Definition" })
keymap("n", "gh", function()
	vim.lsp.buf.hover()
end, { desc = "Hover" })
keymap("n", "gI", function()
	vim.lsp.buf.implementation()
end, { desc = "Go to Implementation" })
keymap("n", "gr", function()
	vim.lsp.buf.references()
end, { desc = "Go to References" })
keymap("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostic Float" })
keymap("n", "<leader>la", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Action" })
keymap("n", "<leader>lj", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go To Next" })
keymap("n", "<leader>lk", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go To Previous" })
keymap("n", "<leader>lr", function()
	vim.lsp.buf.rename()
end, { desc = "Rename" })
keymap("n", "<leader>ls", function()
	vim.lsp.buf.signature_help()
end, { desc = "Signature Help" })
keymap("n", "<leader>lq", function()
	vim.diagnostic.setloclist()
end, { desc = "Set LOC List" })

-- Close NvimTree when DAP opens
local function dap_toggle()
	require("nvim-tree.api").tree.close()
	require("dapui").toggle()
end

-- DAP
wk_add("<leader>d", "Debugger")
keymap("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
keymap("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Continue" })
keymap("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "Step Into" })
keymap("n", "<leader>do", function()
	require("dap").step_over()
end, { desc = "Step Over" })
keymap("n", "<leader>dO", function()
	require("dap").step_out()
end, { desc = "Step Out" })
keymap("n", "<leader>dr", function()
	require("dap").repl.toggle()
end, { desc = "Toggle Repl" })
keymap("n", "<leader>dl", function()
	require("dap").run_last()
end, { desc = "Run Last" })
keymap("n", "<leader>du", dap_toggle, { desc = "Toggle UI" })
keymap("n", "<leader>dt", function()
	require("dap").terminate()
end, { desc = "Terminate" })

-- Git

wk_add("<leader>g", "Git")
keymap("n", "<leader>ga", "<cmd>Git add .<cr>", { desc = "Git Add CWD" })
keymap("n", "<leader>gc", function()
	require("tinygit").smartCommit()
end, { desc = "Git Smart Commit" })
keymap("n", "<leader>gp", function()
	require("tinygit").push()
end, { desc = "Git Push" })
keymap("n", "<leader>gu", "<cmd>Git pull<cr>", { desc = "Git Pull" })
keymap("n", "<leader>gs", "<cmd>Git status<cr>", { desc = "Git Status" })
keymap("n", "<leader>gs", "<cmd>Git diff<cr>", { desc = "Git Diff" })
keymap("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git Blame" })
keymap("n", "<leader>gr", function()
	local width = 80

	vim.cmd("botright vsplit")
	vim.cmd("terminal git graph")

	local buf = vim.api.nvim_get_current_buf()

	vim.bo[buf].buflisted = false

	-- Auto-close when you leave this window
	vim.api.nvim_create_autocmd("WinLeave", {
		buffer = buf,
		once = true, -- ensures it only triggers once
		callback = function()
			-- Make sure window still exists before closing
			local win = vim.fn.bufwinid(buf)
			if win ~= -1 then
				vim.api.nvim_win_close(win, true)
			end
		end,
	})

	vim.cmd("startinsert")
	vim.cmd("vertical resize " .. width)

	vim.api.nvim_create_autocmd("TermClose", {
		buffer = buf,
		once = true,
		callback = function()
			local win = vim.fn.bufwinid(buf)
			if win ~= -1 then
				vim.api.nvim_win_close(win, true)
			end
		end,
	})
end, { desc = "Git Graph" })

wk_add("<leader>gg", "GitHub")
keymap("n", "<leader>ggi", function()
	require("tinygit").issuesAndPrs({ type = "all", state = "all" })
end, { desc = "GitHub Issue Search" })
keymap("n", "<leader>ggu", function()
	require("tinygit").githubUrl()
end, { desc = "GitHub URL Grabber" })
