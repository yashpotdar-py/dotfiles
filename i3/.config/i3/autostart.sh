#!/bin/bash

# Kill existing processes
killall -q polybar picom dunst autotile

# Wait for processes to terminate
while pgrep -x polybar >/dev/null; do sleep 1; done
while pgrep -x picom >/dev/null; do sleep 1; done

# Start compositor with smooth animations
picom --config ~/.config/picom/picom.conf &

# Start polybar
~/.config/polybar/launch.sh &

# Start notification daemon
dunst &

# Start auto-tiling script
python3 ~/.local/bin/autotile &

# Set wallpaper (uncomment and adjust path as needed)
# feh --bg-scale ~/Pictures/wallpapers/bloodborne.jpg &

# Start other applications
sleep 2