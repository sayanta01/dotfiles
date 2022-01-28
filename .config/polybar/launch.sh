#!/bin/bash
#Terminate already running bar instances
killall -q polybar

#Wait until the processes have been shutdown
while pgrep -u 1000 -x polybar >/dev/null; do sleep 1; done

#Launch bar
polybar example &
