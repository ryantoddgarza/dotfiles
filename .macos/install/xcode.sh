#!/bin/bash

set -e

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

is_xcode_command_line_tools_installed() {
  xcode-select --print-path &> /dev/null
}

install_xcode_command_line_tools() {
  if ! is_xcode_command_line_tools_installed
  then
    xcode-select --install
  else
    echo 'exists'
  fi
}

main() {
  install_xcode_command_line_tools
}

main
