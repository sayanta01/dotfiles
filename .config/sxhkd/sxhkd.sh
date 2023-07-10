#!/bin/sh

# Terminate already running bar instances
killall -q sxhkd

# Wait until the processes have been shutdown
while pgrep -u "$(id -u)" -x sxhkd >/dev/null; do sleep 1; done

# Launch bar
sxhkd &
