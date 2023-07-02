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
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>")

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

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = 'Format Code' })
