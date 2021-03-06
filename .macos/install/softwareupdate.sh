#!/bin/bash

# Actions made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Load utils
source ../utils.sh

verbose_script

# macOS software update
sudo softwareupdate --install --all
