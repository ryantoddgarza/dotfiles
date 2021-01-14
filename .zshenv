# ~/.zshenv

# Shell
export PATH="$HOME/.bin:$PATH"

# Terminal
export TERM="screen-256color"
export CLICOLOR=1

# Zsh
export ZSH_DIR="$HOME/.zsh"
export ZSH_CACHE="$HOME/.cache/zsh"

# Node, nvm, npm
export NVM_DIR="$HOME/.nvm"

# Lazy load nvm
NODE_GLOBALS=(`find $NVM_DIR/versions/node -maxdepth 3 -type l -path '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=(node nvm)

load_nvm () {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"
do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@; }"
done

# Go
# export GOPATH=$HOME/go
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
