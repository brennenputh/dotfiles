if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ''

oh-my-posh init fish --config "$HOME/.config/fish/themes/catppuccin_macchiato.omp.json" | source

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# pnpm
set -gx PNPM_HOME "/home/bputh/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end


