#!/usr/bin/env bash

# Terminate already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar with log
echo "---" | tee -a /tmp/polybar.log
polybar main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."