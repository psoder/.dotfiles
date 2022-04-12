# Load: Configurations
source $HOME/.dotfiles/zsh/config

# Load: Plugins
source $HOME/.dotfiles/zsh/plugins

# Load: OH-MY-ZSH
source $ZSH/oh-my-zsh.sh

# Load: ALIASES
source $HOME/.dotfiles/zsh/aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
