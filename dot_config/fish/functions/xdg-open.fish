function xdg-open --wraps=xdg-open $1
  /usr/bin/xdg-open "$(realpath $argv)"
end
