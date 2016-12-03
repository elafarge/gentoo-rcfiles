#!/bin/bash

#
# Scans for available screens and configures i3 workspaces accordingly.
# (Browser on a big screen, Editor on another one if possible, and finally
# Terminals on the laptop screen.
#
# Maintainer Etienne Lafarge
#

# Let's move all workspaces to the laptop screen

i3-msg 'workspace 1 ; move workspace to output eDP1; workspace 2 ; move workspace to output eDP1; workspace 3 ; move workspace to output eDP1; workspace 3 ; workspace 4 ; move workspace to output eDP1; workspace ; move workspace to output eDP1; workspace ; move workspace to output eDP1;'

# Default (laptop screen only) configuration
# Check if the VGA (Left) screen is available...
if [[ -n "$(xrandr | grep "DP1 connected")" ]]; then
  # If so activate it and move our browser there
  echo "Enabling VGA Screen on the left..."
  xrandr --output DP1 --auto --left-of eDP1
  i3-msg 'workspace 2 ; move workspace to output DP1'
else
  i3-msg 'workspace 2 ; move workspace to output eDP1; workspace 2 '
  xrandr --output DP1 --off
fi

# Check if the right screen (HDMi) is plugged in too...
if [[ -n "$(xrandr | grep "HDMI2 connected")" ]]; then
  # If so let's move our dear VIM over there
  echo "Enabling HDMI Screen on the right..."
  xrandr --output HDMI2 --auto --right-of eDP1
  i3-msg 'workspace 3 ; move workspace to output HDMI2'
else
  i3-msg 'workspace 3 ; move workspace to output eDP1; workspace 3 '
  xrandr --output HDMI2 --off
fi
