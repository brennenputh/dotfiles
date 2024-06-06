function detect_is_wsl()
  return os.execute(vim.fn.expand('$HOME/.config/scripts/detect_wsl.sh'))
end
