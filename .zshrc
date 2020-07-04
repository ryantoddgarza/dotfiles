# ~/.zshrc

# theme and appearance

export TERM="screen-256color"

autoload -Uz colors && colors

setopt prompt_subst
PROMPT="%(?:%{$fg[white]%}➜ :%{$fg[red]%}➜ )"
PROMPT+=" %{$fg[cyan]%}%c%{$reset_color%} "

# completion

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# options

zmodload zsh/zprof

# aliases

alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias v.="vim ."
alias txls="tmux list-sessions"
alias txns="tmux new -s"
alias txat="tmux attach -t"
alias bsserve="browser-sync start -sf ."
alias ongoing="cd ~/Code/Ongoing"

# node version manager
export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# skip the verification of insecure directories
ZSH_DISABLE_COMPFIX=true

