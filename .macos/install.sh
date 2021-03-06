#!/bin/bash

set -e

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source utils.sh

main() {
  # Immediately validate sudo user
  validate_sudo

  # Make install scripts executable
  make_scripts_executable 'install'

  # Install
  ./install/main.sh
}

main
