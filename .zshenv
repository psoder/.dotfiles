export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$HOME/.config/zsh"

# bun completions
[ -s "/home/psoder/.bun/_bun" ] && source "/home/psoder/.bun/_bun"
. "$HOME/.cargo/env"
