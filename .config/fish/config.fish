fish_add_path -g ~/.local/bin ~/.bun/bin ~/.cargo/bin ~/linux/bin ~/.local/share/mise/shims

set -gx MANPAGER 'nvim +Man!'
set -gx EDITOR nvim

set -gx NEWT_COLORS '
root=white,black
window=white,black
border=white,black
shadow=black,black
title=brightcyan,black
textbox=white,black
acttextbox=black,cyan
button=black,cyan
actbutton=black,brightcyan
checkbox=white,black
actcheckbox=black,cyan
entry=white,black
disentry=gray,black
label=brightcyan,black
listbox=white,black
actlistbox=black,cyan
sellistbox=brightcyan,black
actsellistbox=black,cyan
emptyscale=white,gray
fullscale=white,cyan
helpline=white,black
roottext=white,black
'

alias gs='git status'
alias dotl='cd ~/.dotfiles'
alias ls='eza'
alias cat='bat'
alias jsontidy="wl-paste | jq '.' | wl-copy; or wl-paste | wl-copy"

function jsontidyfile
    set file $argv[1]

    if jq '.' "$file" >"$file.tmp"
        mv "$file.tmp" "$file"
    else
        rm -f "$file.tmp"
        return 1
    end
end

if status is-interactive
    mise activate fish | source
    starship init fish | source
    atuin init fish | source
    zoxide init fish --cmd cd | source

    if not set -q ZELLIJ
        keychain --quiet id_ed25519
    end
    keychain env --shell fish | source
    if set -q XDG_RUNTIME_DIR SSH_AUTH_SOCK; and test -S "$SSH_AUTH_SOCK"
        ln -sfnT "$SSH_AUTH_SOCK" "$XDG_RUNTIME_DIR/keychain-agent.sock"
    end

    if not set -q ZELLIJ
        zellij attach -c default
    end

    function fish_user_key_bindings
        # Execute this once per mode that emacs bindings should be used in
        fish_default_key_bindings -M insert

        # Then execute the vi-bindings so they take precedence when there's a conflict.
        # Without --no-erase fish_vi_key_bindings will default to
        # resetting all bindings.
        # The argument specifies the initial mode (insert, "default" or visual).
        fish_vi_key_bindings --no-erase insert
    end
end
