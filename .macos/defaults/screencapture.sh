#!/bin/bash

# Set screencapture directory
screencapture_dir="$HOME/Pictures/Screencapture"
mkdir -p $screencapture_dir

# Save screencapture to specified directory
defaults write com.apple.screencapture location -string "$screencapture_dir"

# Save screencapture as jpg
defaults write com.apple.screencapture type -string "jpg"

# Remove default timestamp
defaults write com.apple.screencapture include-date -bool false

# Set screencapture filename
defaults write com.apple.screencapture name -string "$(hostname)-$(date +"%Y%m%dT%H%M%S")"

# Disable drop shadow
defaults write com.apple.screencapture disable-shadow -bool true
