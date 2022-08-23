# Terminal type
export TERM="screen-256color"

# Unique PATH values only
typeset -U PATH path

# Modify PATH
path+=/opt/homebrew/bin
path+=$HOME/.local/bin
path+=$HOME/.node-versions/current/bin

# Export PATH to subprocesses
export PATH

# Cleanup home dir
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$HOME/.cache/node_repl_history"
