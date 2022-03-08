

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"







# Load: Configurations
source $HOME/.dotfiles/zsh/config

# Load: Plugins
source $HOME/.dotfiles/zsh/plugins

# Load: OH-MY-ZSH
source $ZSH/oh-my-zsh.sh

# Load: ALIASES
source $HOME/.dotfiles/zsh/aliases