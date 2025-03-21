# BSD general commands
alias ls="ls -F"
alias cp="cp -iv"
alias mv="mv -iv"
alias du="du -csh"

# BSD system manager
alias shutdown="sudo shutdown -h now"
alias restart="sudo shutdown -r now"

# App configuration
alias zconfig="vim ~/.zsh/"
alias vconfig="vim ~/.vimrc"
alias tconfig="vim ~/.tmux.conf"
alias gconfig="vim ~/.gitconfig"

# App commands
alias v="vim ."
alias nv="nvim ."
alias g="git"
alias dotf="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias todo="task ~/Documents/tasks.txt"
alias txls="tmux list-sessions"
alias txns="tmux new-session -s"
alias txks="tmux kill-session -t"
alias txat="tmux attach -t"

# Node
alias node20="export PATH=/opt/homebrew/opt/node@20/bin:$PATH; node --version"
