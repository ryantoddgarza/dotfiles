#!/bin/bash

# Ensure the following actions are
# made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Install
./softwareupdate.sh
./xcode.sh
./homebrew.sh
