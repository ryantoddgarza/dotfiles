#!/bin/bash

set -e

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

main() {
  brew tap homebrew/cask-fonts
  install_brew_package font-meslo-lg
}

main
