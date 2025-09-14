set -gx PATH $PATH ~/.local/bin


set -gx PATH $PATH ~/linux/bin
set -gx PATH $PATH ~/linux/bin

set -gx MANPAGER 'nvim +Man!'

alias gs='git status'
alias dotl='cd ~/.dotfiles'
alias ls='eza'
alias cat='bat'

if status is-interactive
	~/.local/bin/mise activate fish | source
	starship init fish | source
	atuin init fish | source
	zoxide init fish --cmd cd | source

	if status --is-interactive
		keychain --eval --quiet -Q id_ed25519 | source
	end

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

end

