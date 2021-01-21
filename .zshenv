# ~/.zshenv

# Terminal
export TERM="screen-256color"

# Path
typeset -U path
path+=$HOME/.bin

# Cleanup ~/
export LESSHISTFILE="-"
