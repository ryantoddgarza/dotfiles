#!/bin/bash

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Open new Finder window in home directory
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME"

# Hide recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Kill all Finder processes
killall Finder
