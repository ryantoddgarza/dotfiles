#!/bin/bash

set -e

# Load utils
cd "$(dirname "${BASH_SOURCE[0]}")" && source ../utils.sh

verbose_script

is_xcode_command_line_tools_installed() {
  xcode-select --print-path &> /dev/null
}

install_xcode_command_line_tools() {
  if ! is_xcode_command_line_tools_installed
  then
    xcode-select --install
  fi
}

main() {
  install_xcode_command_line_tools
}

main
