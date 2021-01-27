#!/bin/bash

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# OS
./softwareupdate.sh

# Homebrew + packages
./xcode.sh
./homebrew.sh

./zsh.sh
./tmux.sh
./vim.sh
./git.sh
./development.sh
./deployment.sh
./productivity.sh
./apps.sh
./fonts.sh
