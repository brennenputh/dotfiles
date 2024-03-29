-- Shorten function name
local function keymap(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

--[[ NORMAL MODE ]]--

-- Register Preservation for dd
vim.keymap.set("n", "dd", function ()
  if vim.fn.getline(".") == "" then return '"_dd' end
  return "dd"
end, {expr = true})

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

-- Indent File
keymap("n", "<leader>I", "gg=G", { desc = "Indent File" })

--[[ VISUAL MODE ]]--

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Better Paste
keymap("v", "p", "P")

--[[ PLUGINS ]]--

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
keymap("n", "<leader>fr", ":Telescope live_grep<CR>", { desc = 'Ripgrep' })
keymap("n", "<leader>fp", ":Telescope projects<CR>", { desc = 'Project Select' })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = 'Buffer Select' })

-- Close dap when nvim tree opens
local function tree_toggle()
  require('dapui').close()
  require('nvim-tree.api').tree.toggle()
end

-- nvim-tree
keymap("n", "<leader>e", tree_toggle, { desc = "Nvim Tree" })

-- Trouble
keymap("n", "<leader>tt", ":TroubleToggle<CR>", { desc = 'Toggle Trouble' })
keymap("n", "<leader>tw", ":TroubleToggle workspace_diagnostics<CR>", { desc = 'Workspace Diagnostics' })
keymap("n", "<leader>td", ":TroubleToggle document_diagnostics<CR>", { desc = 'Document Diagnostics' })
keymap("n", "<leader>tq", ":TroubleToggle quickfix<CR>", { desc = 'Quickfix' })
keymap("n", "<leader>tl", ":TroubleToggle loclist<CR>", { desc = 'LOCList' })
keymap("n", "<leader>tr", ":TroubleToggle lsp_references<CR>", { desc = 'LSP References' })

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

-- Close NvimTree when DAP opens
local function dap_toggle()
  require("nvim-tree.api").tree.close()
  require('dapui').toggle()
end

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = 'Continue' })
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = 'Step Into' })
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = 'Step Over' })
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", { desc = 'Step Out' })
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = 'Toggle Repl'})
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = 'Run Last' })
keymap("n", "<leader>du", dap_toggle, { desc = 'Toggle UI' })
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", { desc = 'Terminate' })
