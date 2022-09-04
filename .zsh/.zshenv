# Cross-Desktop Group (XDG) base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Zsh env
export ZDOTDIR=$HOME/.zsh

# Zsh history
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=100
export SAVEHIST=$HISTSIZE

# Terminal type
export TERM="screen-256color"

# Output colored file types
export CLICOLOR=1

# Cleanup home dir
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
