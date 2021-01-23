ZSH_CACHE="$HOME/.cache/zsh"

# Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'l:|=* r:|=*'

setopt complete_in_word

autoload -Uz compinit
compinit -d "$ZSH_CACHE/zcompdump-$ZSH_VERSION"

# History
export HISTFILE="$ZSH_CACHE/zsh_history"
export HISTSIZE=100
export SAVEHIST=$HISTSIZE

setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# Vim mode
bindkey -v

# Syntax
export CLICOLOR=1
