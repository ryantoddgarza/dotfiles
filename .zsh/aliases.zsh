# system
alias shutdown="sudo shutdown -h now"
alias restart="sudo shutdown -r now"
alias sleep="pmset sleepnow"

# config
alias zconfig="vim ~/.zsh/"
alias vconfig="vim ~/.vimrc"
alias tconfig="vim ~/.tmux.conf"

# bin
alias ls="ls -F"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

# tmux
alias txls="tmux list-sessions"
alias txns="tmux new-session -s"
alias txkt="tmux kill-session -t"
alias txat="tmux attach -t"

# vim
alias v.="vim ."

# git
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gcom="git checkout master"
alias gd="git diff"
alias gl="git log"
alias gpush="git push"
alias gpull="git pull"
alias gr="git reset"
alias gs="git status"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# folders
alias ongoing="cd ~/Code/Ongoing"

# misc
alias bsserve="browser-sync start -sf ."
