#!/bin/bash

# Screencapture directory
screencapture_dir="${HOME}/Pictures/Screencapture"

# Create screencapture directory if it doesn't exist
mkdir -p $screencapture_dir

# Save screenshots to specified directory
defaults write com.apple.screencapture location -string "$screencapture_dir"

# Remove default timestamp
defaults write com.apple.screencapture include-date -bool false

# Save screenshots as jpg
defaults write com.apple.screencapture type -string "jpg"

# Prefix screenshots filename
defaults write com.apple.screencapture name -string "$(hostname)-$(date +"%Y%j_%H%M%S")"

# Disable drop shadow
defaults write com.apple.screencapture disable-shadow -bool true
