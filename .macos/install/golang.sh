#!/bin/bash

set -e

# Ensure the following actions are
# made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

is_installed() {
  go version &> /dev/null
}

install_go() {
  if ! is_installed
  then
    brew install golang
    mkdir -p $HOME/go/{bin,src,pkg}
  else
    echo 'exists'
  fi
}

main() {
  install_go
}

main
