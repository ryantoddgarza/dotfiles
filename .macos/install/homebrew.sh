#!/bin/bash

set -e

# Ensure the following actions are
# made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

is_installed() {
  which brew &> /dev/null
}

install_homebrew() {
  if ! is_installed
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo 'exists'
  fi
}

main() {
  install_homebrew

  brew analytics off
  brew update
  brew upgrade
}

main
