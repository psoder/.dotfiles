# Load: Configurations
source $ZDOTDIR/.config

# Load: OH-MY-ZSH
source $ZDOTDIR/.oh-my-zsh/oh-my-zsh.sh

# Load: Plugins
source $ZDOTDIR/.plugins

# Load: ALIASES
source $ZDOTDIR/.aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh <--- Does not work for some reason
source $ZDOTDIR/.p10k.zsh

export N_PREFIX="$HOME/.dotfiles/js/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

eval "$(mise activate zsh)"
