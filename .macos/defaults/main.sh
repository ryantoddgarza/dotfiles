#!/bin/bash

# Ensure the following actions are
# made relative to this file's path
cd "$(dirname "${BASH_SOURCE[0]}")"

# Close any open `System Preferences` panes in order to
# avoid overriding the preferences that are being changed.
./close_system_preferences_panes.applescript

# Preferences
./dock.sh
./finder.sh
./input_devices.sh
./network.sh
./power_management.sh
./screencapture.sh
