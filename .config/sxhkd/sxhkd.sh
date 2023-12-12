#!/bin/sh

killall -q sxhkd

# Wait until the processes have been shutdown
while pgrep -u "$(id -u)" -x sxhkd >/dev/null; do sleep 1; done

sxhkd &
