# system
alias shutdown="sudo shutdown now"
alias restart="sudo shutdown -r now"
alias sleep="pmset sleepnow"

# config
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

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
alias gcl="git clone"
alias gco="git checkout"
alias gcom="git checkout master"
alias gd="git diff"
alias gl="git log"
alias gpush="git push"
alias gpull="git pull"
alias gr="git remote"
alias gs="git status"
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