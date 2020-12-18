#!/bin/bash

# Load utils
cd "$(dirname "${BASH_SOURCE[0]}")" && source ../utils.sh

verbose_script

# macOS software update
sudo softwareupdate -i -a
