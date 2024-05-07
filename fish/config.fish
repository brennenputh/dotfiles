if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ''

oh-my-posh init fish --config "$HOME/.config/fish/themes/catppuccin_macchiato.omp.json" | source
