# ~/.zshenv

# Shell
export PATH="$HOME/.bin:$PATH"

# Terminal
export TERM="screen-256color"
export CLICOLOR=1

# Zsh
export ZSH_DIR="$HOME/.zsh"
export ZSH_CACHE="$HOME/.cache/zsh"

# Node, NVM, NPM
export NVM_DIR="$HOME/.nvm"

# Go
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
