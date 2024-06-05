local M = {
  'arminveres/md-pdf.nvim',
  branch = 'fix/echo-loop',
  lazy = true
}

function M.config()
  require('md-pdf').setup({
    margins = "1.5cm",
  })
end

return M
