#!/bin/bash

set -e

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

install_golang() {
  install_brew_package golang
  mkdir -p $HOME/go/{bin,src,pkg}
}

install_hugo() {
  install_brew_package hugo
}

install_mongodb_community() {
  brew tap mongodb/brew
  install_brew_package mongodb-community
}

install_python() {
  install_brew_package python
}

main() {
  install_golang
  install_hugo
  install_mongodb_community
  install_python
}

main
