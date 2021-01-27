#!/bin/bash

set -e

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

main() {
  install_brew_package pandoc
  install_brew_package rsync
  install_brew_package tree
}

main
