local M = {
  'arminveres/md-pdf.nvim',
  branch = 'fix/echo-loop',
  lazy = true
}

local function get_open_command()
  local os_name = vim.uv.os_uname().sysname
  if os_name == "Linux" then
    local is_wsl = os.execute(os.getenv('HOME') .. '/.config/scripts/detect_wsl.sh')
    if is_wsl == 1 then
      return 'xdg-open'
    else
      -- Why would I not have Zathura on non-wsl?
      return 'zathura'
    end
  elseif os_name == "Windows_NT" then
    return "powershell.exe"
  elseif os_name == "Darwin" then
    return "open"
  end
end

function M.config()
  require('md-pdf').setup({
    margins = "1.5cm",
    preview_cmd = get_open_command
  })
end

return M
