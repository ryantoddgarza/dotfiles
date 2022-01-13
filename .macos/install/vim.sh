#!/bin/bash

set -e

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

install() {
  install_brew_package vim
}

configure() {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update --init
}

main() {
  install
  configure
}

main
