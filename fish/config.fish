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

# school-related functions
function in-data-structures
  cd $WINHOME/Obsidian\ Vault/School/Data-Structures/
  wsl-open 'obsidian://open?vault=Obsidian%20Vault' &
  nvim School/Data-Structures/Data-Structures-(date -Idate).md
end

function in-cyber-def
  cd $WINHOME/Obsidian\ Vault/School/Cyber-Defense/
  wsl-open 'obsidian://open?vault=Obsidian%20Vault' &
  nvim School/Data-Structures/Cyber-Defense-(date -Idate).md
end

function in-pls
  cd $WINHOME/Obsidian\ Vault/School/PLS/
  wsl-open 'obsidian://open?vault=Obsidian%20Vault' &
  nvim School/Data-Structures/PLS-(date -Idate).md
end
