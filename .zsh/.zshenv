# Cross-Desktop Group (XDG) base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Zsh env
export ZDOTDIR=$HOME/.zsh
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
if [[ ! -d $ZSH_CACHE_DIR ]];
then
  mkdir -p $ZSH_CACHE_DIR
fi

# Zsh history
export HISTFILE="$ZSH_CACHE_DIR/zsh_history"
export HISTSIZE=100
export SAVEHIST=$HISTSIZE

# Terminal type
export TERM="screen-256color"

# Output colored file types
export CLICOLOR=1

# Cleanup home dir
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$HOME/.cache/node_repl_history"
