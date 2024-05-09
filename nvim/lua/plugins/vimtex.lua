local M = {
  "lervag/vimtex",
  lazy = false
}

function M.config()
  vim.g.vimtex_compiler_method = 'latexmk'
  vim.g.vimtex_view_method = 'zathura'
end

return M
