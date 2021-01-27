#!/bin/bash

set -e

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

main() {
  install_brew_package iterm2 --cask
  install_brew_package google-chrome --cask
}

main
