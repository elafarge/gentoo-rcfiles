#!/bin/bash

# Script that starts Polybar on all connected screens

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR=eDP1 polybar top &
if [ "$(cat /sys/class/drm/card0-DP-1/status)" == "connected" ] ; then
  MONITOR=DP1 polybar top &
fi
if [ "$(cat /sys/class/drm/card0-HDMI-A-2/status)" == "connected" ] ; then
  MONITOR=HDMI2 polybar top &
fi

exit 0
