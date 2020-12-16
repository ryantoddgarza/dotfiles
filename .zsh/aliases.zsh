# system
alias shutdown="sudo shutdown -h now"
alias restart="sudo shutdown -r now"

# config
alias zconfig="vim ~/.zsh/"
alias vconfig="vim ~/.vimrc"
alias tconfig="vim ~/.tmux.conf"
alias gconfig="vim ~/.gitconfig"

# bin
alias ls="ls -F"
alias cp="cp -iv"
alias mv="mv -iv"
alias du="du -csh"

# tmux
alias txls="tmux list-sessions"
alias txns="tmux new-session -s"
alias txkt="tmux kill-session -t"
alias txat="tmux attach -t"

# vim
alias v="vim ."

# git
alias g="git"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# folders
alias ongoing="cd ~/Code/Ongoing"

# misc
alias bsserve="browser-sync start -sf ."
