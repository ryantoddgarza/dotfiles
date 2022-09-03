# Unique PATH values only
typeset -U PATH path

# Modify PATH
path=(/opt/homebrew/bin $path)
path+=$HOME/.local/bin
path+=$HOME/.node-versions/current/bin

# Export PATH to subprocesses
export PATH
