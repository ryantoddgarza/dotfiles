# ~/.zshrc

# profiling

zmodload zsh/zprof

# theme and appearance

export TERM="screen-256color"

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

# system
alias shutdown="sudo shutdown now"
alias restart="sudo shutdown -r now"
alias sleep="pmset sleepnow"
# config
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
# tmux
alias txls="tmux list-sessions"
alias txns="tmux new -s"
alias txat="tmux attach -t"
# vim
alias v.="vim ."
# git
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# sql
alias mysql="sudo /usr/local/bin/mysql"
alias mysql.start="sudo /usr/local/mysql/support-files/mysql.server start"
alias mysql.stop="sudo /usr/local/mysql/support-files/mysql.server stop"
alias mysql.restart="sudo /usr/local/mysql/support-files/mysql.server restart"
alias mysql.status="sudo /usr/local/mysql/support-files/mysql.server status"
# folders
alias ongoing="cd ~/Code/Ongoing"
# misc
alias bsserve="browser-sync start -sf ."

# node version manager
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

# skip the verification of insecure directories
ZSH_DISABLE_COMPFIX=true
