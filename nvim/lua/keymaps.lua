-- Shorten function name
local function keymap(mode, lhs, rhs, opts)
   local options = { silent = true }
   if opts then
      options = vim.tbl_extend('force', options, opts)
   end
   vim.keymap.set(mode, lhs, rhs, options)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Predefined --

-- Normal --

-- Register Preservation dd
vim.keymap.set("n", "dd", function ()
	if vim.fn.getline(".") == "" then return '"_dd' end
	return "dd"
end, {expr = true})

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")
keymap("n", "<S-z>", "<cmd>Bdelete!<CR>")

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = 'Clear Highlights' })

-- Visual --

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Better paste
keymap("v", "p", "P")

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = 'Open File Tree' })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = 'Find Files' })
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", { desc = 'Grep' })
keymap("n", "<leader>fp", ":Telescope projects<CR>", { desc = 'Project Select' })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = 'Buffer Select' })

-- Trouble
keymap("n", "<leader>tt", ":TroubleToggle<CR>", { desc = 'Toggle Trouble' })
keymap("n", "<leader>tw", ":TroubleToggle workspace_diagnostics<CR>", { desc = 'Workspace Diagnostics' })
keymap("n", "<leader>td", ":TroubleToggle document_diagnostics<CR>", { desc = 'Document Diagnostics' })
keymap("n", "<leader>tq", ":TroubleToggle quickfix<CR>", { desc = 'Quickfix' })
keymap("n", "<leader>tl", ":TroubleToggle loclist<CR>", { desc = 'LOCList' })
keymap("n", "<leader>tr", ":TroubleToggle lsp_references<CR>", { desc = 'LSP References' })

-- Diffview
keymap("n", "<leader>so", ":DiffviewOpen<CR>", { desc = 'Open Diff View' })
keymap("n", "<leader>sc", ":DiffviewClose<CR>", { desc = 'Close Diff View' })

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = 'Toggle Breakpoint' })
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = 'Continue' })
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = 'Step Into' })
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = 'Step Over' })
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", { desc = 'Step Out' })
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = 'Toggle Repl'})
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = 'Run Last' })
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", { desc = 'Toggle UI' })
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", { desc = 'Terminate' })

-- LSP
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = 'Format Code' })
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = 'Go to Declaration' })
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = 'Go to Definition' })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = 'Hover' })
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = 'Go to Implementation' })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = 'Go to References' })
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = 'Open Diagnostic Float' })
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = 'Code Action' })
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", { desc = 'Go To Next' })
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", { desc = 'Go To Previous' })
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = 'Rename' })
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = 'Signature Help' })
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = 'Set LOC List' })

