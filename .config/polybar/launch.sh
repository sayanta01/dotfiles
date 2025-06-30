#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch
if command -v xrandr >/dev/null 2>&1; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar example &
  done
else
  polybar example &
fi
