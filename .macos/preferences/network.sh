#!/bin/bash

# Use Cloudflare DNS
sudo networksetup -setdnsservers Wi-Fi \
  1.1.1.1 \
  1.0.0.1 \
  2606:4700:4700::1111 \
  2606:4700:4700::1001

# Disable AirDrop
defaults write com.apple.NetworkBrowser DisableAirDrop -bool true
