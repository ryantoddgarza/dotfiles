# Vim mode
bindkey -v

# lazy load nvm FIXME
# NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 4 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
# NODE_GLOBALS+=(node nvm)

# load_nvm () {
#   [[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"
# }

# for cmd in "${NODE_GLOBALS[@]}"; do
#   eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@; }"
# done

# always load nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"


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
