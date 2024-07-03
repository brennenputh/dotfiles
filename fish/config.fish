if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ''

oh-my-posh init fish --config "$HOME/.config/fish/themes/catppuccin_macchiato.omp.json" | source

if $HOME/bin/detect_wsl
  set -g WINDRIVE '/mnt/c/'
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
