# ~/.zshenv

# Terminal
export TERM="screen-256color"

# Path
typeset -U path
path+=$HOME/.local/bin
path=($HOME/.node-versions/current/bin $path)

# Cleanup home dir
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$HOME/.cache/node_repl_history"
