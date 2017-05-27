#!/bin/bash

#
# Scans for available screens and configures i3 workspaces accordingly.
# (Browser on a big screen, Editor on another one if possible, and finally
# Terminals on the laptop screen.
#
# Maintainer Etienne Lafarge
#

# Basic X configuration
X_USER=etienne
export DISPLAY=:0
export XAUTHORITY=/home/$X_USER/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# Close all polybars
killall polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

# Let's move all workspaces to the laptop screen
i3-msg 'workspace 1 ; move workspace to output eDP1; workspace 2 ; move workspace to output eDP1; workspace 3 ; move workspace to output eDP1; workspace 3 ; workspace 4 ; move workspace to output eDP1; workspace ; move workspace to output eDP1; workspace ; move workspace to output eDP1;'

xrandr --output eDP1 --auto --pos 0x0 --mode 1920x1080
MONITOR=eDP1 polybar top &

# Default (laptop screen only) configuration
# Check if the VGA (Left) screen is available...
if [ "$(cat /sys/class/drm/card0-DP-1/status)" == "connected" ] ; then
  # If so activate it and move our browser there
  echo "Enabling VGA Screen on the left of the laptop..."
  xrandr --output DP1 --auto --pos 1920x0 # --mode 1400x900
  i3-msg 'workspace 3 ; move workspace to output HDMI2'
  MONITOR=DP1 polybar top &
elif [ "$(cat /sys/class/drm/card0-DP-1/status)" == "disconnected" ] ; then
  i3-msg 'workspace 3 ; move workspace to output eDP1; workspace 3 '
  xrandr --output DP1 --off
fi

# Check if the right screen (HDMi) is plugged in too...
if [ "$(cat /sys/class/drm/card0-HDMI-A-2/status)" == "connected" ] ; then
  # If so let's move our dear VIM over there
  echo "Enabling HDMI Screen on the right..."
  xrandr --output HDMI2 --auto --pos 3840x0 --mode 1920x1080
  i3-msg 'workspace 2 ; move workspace to output DP1'
  MONITOR=HDMI2 polybar top &
elif [ "$(cat /sys/class/drm/card0-HDMI-A-2/status)" == "disconnected" ] ; then
  i3-msg 'workspace 2 ; move workspace to output eDP1; workspace 2 '
  xrandr --output HDMI2 --off
fi

# I want a damn wallpaper
feh --bg-fill ~/Pictures/deviantart/metal_dawn.jpg &
