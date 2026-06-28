# This bothered me.
if status is-interactive
    if test (pwd) = /var/home/bputh
        cd ~
    end
end

set -g fish_greeting ''
fish_add_path -g ~/.local/bin/

if type -q starship
    starship init fish | source
else
    echo "Unable to find starship executable, fancy prompt unavailable."
end

if type -q zoxide
    zoxide init fish | source
else
    echo "Unable to find zoxide executable."
end

if type -q brew
    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

    set -gx LD_LIBRARY_PATH "$(brew --prefix)/lib" "$LD_LIBRARY_PATH"
end

if type -q nvim
    set -gx EDITOR nvim
end

if type -q pnpm
    set -gx PNPM_HOME "/home/bputh/.local/share/pnpm"
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end
end
