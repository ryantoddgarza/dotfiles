#!/bin/bash

set -e

main() {
  # Ensure the following actions are
  # made relative to this file's path
  cd "$(dirname "${BASH_SOURCE[0]}")"

  # Load utils
  source utils.sh

  # Immediately validate sudo user
  validate_sudo

  # Make install scripts executable
  make_scripts_executable 'install'

  # Install
  ./install/softwareupdate.sh
  ./install/xcode.sh
  ./install/homebrew.sh
}

main
