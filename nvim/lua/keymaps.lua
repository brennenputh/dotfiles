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
vim.keymap.set("n", "x", "_x")

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

--[[ VISUAL MODE ]]

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Better Paste
keymap("v", "p", "P")

--[[ PLUGINS ]]

-- Telescope
wk_add("<leader>f", "Telescope")
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fr", ":Telescope live_grep<CR>", { desc = "Ripgrep" })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buffer Select" })

-- Close dap when nvim tree opens
local function tree_toggle()
	require("dapui").close()
	require("nvim-tree.api").tree.toggle()
end

-- nvim-tree
keymap("n", "<leader>e", tree_toggle, { desc = "Nvim Tree" })

-- Trouble
wk_add("<leader>t", "Trouble")
keymap("n", "<leader>tt", function () require("trouble").toggle("diagnostics") end, { desc = "Trouble Diagnostics" })
keymap("n", "<leader>tl", function () require("trouble").toggle("lsp") end, { desc = "Trouble LSP" })

-- Conform (Formatting)
keymap("n", "<leader>I", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format File" })

-- md-pdf
keymap("n", "<leader>mm", function()
	require("md-pdf").convert_md_to_pdf()
end, { desc = "Convert Markdown into PDF" })

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
keymap("n", "<leader>cb", function()
	require("chainsaw").beepLog()
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
	vim.lsp.buf.format({ async = true })
end, { desc = "Format Code" })
keymap("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "Go to Declaration" })
keymap("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to Definition" })
keymap("n", "K", function()
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
	vim.lsp.buf.code_action({ apply = true })
end, { desc = "Code Action" })
keymap("n", "<leader>lj", function()
	vim.diagnostic.goto_next()
end, { desc = "Go To Next" })
keymap("n", "<leader>lk", function()
	vim.diagnostic.goto_prev()
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
keymap("n", "<leader>ga", function()
  require("tinygit").interactiveStaging()
end, { desc = "Git Interactive Add" })
keymap("n", "<leader>gc", function()
	require("tinygit").smartCommit()
end, { desc = "Git Smart Commit" })
keymap("n", "<leader>gp", function()
	require("tinygit").push()
end, { desc = "Git Push" })
keymap("n", "<leader>gu", "<cmd>Git pull<cr>", { desc = "Git Pull" })
keymap("n", "<leader>gs", "<cmd>Git status<cr>", { desc = "Git Status" })
keymap("n", "<leader>gd", function()
	require("tinygit").searchFileHistory()
end, { desc = "Git File History" })
keymap("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git Blame" })
