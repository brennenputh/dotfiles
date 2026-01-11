# This bothered me.
if status is-interactive
  if test (pwd) = "/var/home/bputh"
    cd ~
  end
end

set -g fish_greeting ''

starship init fish | source
zoxide init fish | source

fish_add_path -g ~/.local/bin/

if type -q brew
    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end
end

set -gx EDITOR nvim

# pnpm
set -gx PNPM_HOME "/home/bputh/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
