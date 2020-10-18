export HISTFILE="$ZSH_CACHE/zsh_history"
export HISTSIZE=100
export SAVEHIST=$HISTSIZE

setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
