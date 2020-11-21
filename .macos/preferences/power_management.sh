#!/bin/bash

# Restore defaults to overwrite any haphazard settings
# All pm settings to be made in this script
sudo pmset restoredefaults > /dev/null

# Sleep the display after 15 minutes while charging
sudo pmset -c displaysleep 15

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Sleep the display after 2 minutes on battery
sudo pmset -b displaysleep 2

# Set machine sleep to 5 minutes on battery
sudo pmset -b sleep 5

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400
