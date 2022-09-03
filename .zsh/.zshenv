# Zsh env
export ZDOTDIR=$HOME/.zsh
export ZCACHE="$HOME/.cache/zsh"
mkdir -p $ZCACHE

# Zsh history
export HISTFILE="$ZCACHE/zsh_history"
export HISTSIZE=100
export SAVEHIST=$HISTSIZE

# Terminal type
export TERM="screen-256color"

# Output colored file types
export CLICOLOR=1

# Cleanup home dir
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$HOME/.cache/node_repl_history"
