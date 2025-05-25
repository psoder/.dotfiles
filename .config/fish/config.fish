set -gx PATH $PATH ~/.local/bin


set -gx PATH $PATH ~/linux/bin
set -gx PATH $PATH ~/linux/bin

alias gs='git status'
alias dotl='cd ~/.dotfiles'
alias ls='eza'
alias cat='bat'

if status is-interactive
	~/.local/bin/mise activate fish | source
	starship init fish | source
	atuin init fish | source

	if set -q ZELLIJ
	else
		zellij
	end
end

