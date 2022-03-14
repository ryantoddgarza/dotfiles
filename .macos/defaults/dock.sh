#!/bin/bash

# Autohide dock
defaults write com.apple.dock autohide -bool true

# Disable show recent apps in dock
defaults write com.apple.dock show-recents -bool false

# Kill all dock processes
killall Dock
