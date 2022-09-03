# Completion
autoload -Uz compinit
compinit -d "$ZCACHE/zcompdump-$ZSH_VERSION"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'l:|=* r:|=*'
setopt complete_in_word

# History
export HISTFILE="$ZCACHE/zsh_history"
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
