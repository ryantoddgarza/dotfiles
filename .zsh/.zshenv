# Terminal type
export TERM="screen-256color"

# Path management
# Unique values only
typeset -U PATH path
# Modify path
path+=$HOME/.local/bin
path=($HOME/.node-versions/current/bin $path)
# Export to subprocesses
export PATH

# Cleanup home dir
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$HOME/.cache/node_repl_history"
