set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.bun/bin
set -gx PATH $PATH ~/linux/bin
set -gx PATH $PATH ~/.moon/bin

set -gx MANPAGER 'nvim +Man!'
set -gx EDITOR 'nvim'

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

if status is-interactive
	mise activate fish | source
	starship init fish | source
	atuin init fish | source
	zoxide init fish --cmd cd | source

	if set -q ZELLIJ
	else
		zellij
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

	if status --is-interactive
	    keychain --quiet id_ed25519
	    if test -f ~/.keychain/(hostname)-fish
		source ~/.keychain/(hostname)-fish
	    end
	end
end

