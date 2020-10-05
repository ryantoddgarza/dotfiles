# ~/.zshrc

ZSH_DISABLE_COMPFIX=true

# profiling

zmodload zsh/zprof

# theme and appearance

autoload -Uz colors && colors

# prompt

git_prompt_info() {
  ref=${$(command git symbolic-ref HEAD 2> /dev/null)#refs/heads/} || \
    ref=${$(command git rev-parse HEAD 2>/dev/null)[1][1,7]} || \
    return
  case "$TERM" in
    *-256color)             branchcolor=$'\e[38;5;36m'   ;;
    *)                      branchcolor="$fg_bold[cyan]" ;;
  esac
  print -Pn '(%%{$branchcolor%%}%20>..>$ref%<<%%{\e[00m%%})'
}

local usercolor="$fg_bold[yellow]"
local dircolor="$fg_bold[cyan]"
case "$TERM" in
  *-256color)
    usercolor=$'\e[38;5;184m'
    dircolor=$'\e[38;5;38m'
    ;;
esac
[ $UID = '0' ] && usercolor="$fg_bold[white]"
reset_color=$'\e[00m'

setopt prompt_subst
PROMPT="%(?:%{$fg[white]%}➜ :%{$fg[red]%}➜ )"
PROMPT+=" %{$dircolor%}%c%{$reset_color%} "
PROMPT+="\$(git_prompt_info) "

# history

setopt inc_append_history
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# completion

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

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

# node, nvm, npm

NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=(node nvm)

load_nvm () {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@; }"
done
