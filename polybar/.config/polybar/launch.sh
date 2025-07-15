#!/bin/bash

# Kill any existing bars
killall -q polybar

# Wait until all polybar processes close
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar on main display
polybar main &

