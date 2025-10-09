#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch
for m in $(polybar -M | cut -d ':' -f1); do
  MONITOR=$m polybar example &
done
