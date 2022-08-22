#!/bin/bash

FINDER_PLIST="$HOME/Library/Preferences/com.apple.finder.plist"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Open new Finder window in home directory
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME"

# Hide recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Desktop view settings
plutil -replace DesktopViewSettings.GroupBy -string "None" $FINDER_PLIST
plutil -replace DesktopViewSettings.IconViewSettings.arrangeBy -string "kind" $FINDER_PLIST
plutil -replace DesktopViewSettings.IconViewSettings.gridSpacing -integer 48 $FINDER_PLIST
plutil -replace DesktopViewSettings.IconViewSettings.iconSize -integer 48 $FINDER_PLIST
plutil -replace DesktopViewSettings.IconViewSettings.labelOnBottom -integer 0 $FINDER_PLIST
plutil -replace DesktopViewSettings.IconViewSettings.showIconPreview -integer 1 $FINDER_PLIST
plutil -replace DesktopViewSettings.IconViewSettings.showItemInfo -integer 0 $FINDER_PLIST
plutil -replace DesktopViewSettings.IconViewSettings.textSize -integer 12 $FINDER_PLIST

unset FINDER_PLIST

# Kill all Finder processes
killall Finder
