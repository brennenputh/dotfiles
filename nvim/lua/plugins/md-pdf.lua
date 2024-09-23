local M = {
  'arminveres/md-pdf.nvim',
  branch = 'main',
  lazy = true
}

local function get_open_command()
  local os_name = vim.uv.os_uname().sysname
  if os_name == "Linux" then
    return 'zathura'
  elseif os_name == "Windows_NT" then
    return "powershell.exe"
  elseif os_name == "Darwin" then
    return "open"
  end
end

function M.config()
  require('md-pdf').setup({ toc = false })
end

return M
