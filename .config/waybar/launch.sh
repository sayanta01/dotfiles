#!/usr/bin/env sh

# Terminate already running bar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -u "$(id -u)" -x waybar >/dev/null; do sleep 1; done

waybar &
