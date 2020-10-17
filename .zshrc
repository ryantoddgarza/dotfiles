# ~/.zshrc

# profiling
zmodload zsh/zprof

# theme and appearance
autoload -Uz colors && colors

# prompt
prompt_color() {
  [[ -n "$1" ]] && print "%{$2%}$1%{$reset_color%}"
}

local success_color="$fg[white]"
local error_color="$fg[red]"
local dir_color="$fg[cyan]"
local branch_color="$fg[yellow]"

prompt_dircolor() { print "$(prompt_color "$1" "$dir_color")" }
prompt_branchcolor() { print "$(prompt_color "$1" "$branch_color")" }
prompt_successcolor() { print "$(prompt_color "$1" "$success_color")" }
prompt_errorcolor() { print "$(prompt_color "$1" "$error_color")" }

prompt_exit_status() { print "%(?:$(prompt_successcolor "➜ "):$(prompt_errorcolor "➜ "))" }
prompt_shortened_path() { print "$(prompt_dircolor "%1~")" }
prompt_git_branch() {
  ref=${$(command git symbolic-ref HEAD 2> /dev/null)#refs/heads/} || \
    ref=${$(command git rev-parse HEAD 2>/dev/null)[1][1,7]} || \
    return
  print "($(prompt_branchcolor "%20>..>$ref%<<"))"
}

setopt prompt_subst

PS1='$(prompt_exit_status) $(prompt_shortened_path) $(prompt_git_branch) '

# history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# completion
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# aliases
if [[ -r ~/.aliasrc ]]; then
  source ~/.aliasrc
fi

# tmux
if [ -z $TMUX  ]; then;
  tmux;
fi

# node, nvm, npm
# NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 4 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
# NODE_GLOBALS+=(node nvm)

# load_nvm () {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# }

# for cmd in "${NODE_GLOBALS[@]}"; do
#   eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@; }"
# done

# plugins
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
