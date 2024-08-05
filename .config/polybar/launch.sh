#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch
polybar example &

# desktop=$DESKTOP_SESSION
# case $desktop in
# bspwm | /usr/share/xsessions/bspwm)
# 	if type "xrandr" >/dev/null; then
# 		for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
# 			MONITOR=$m polybar --reload example &
# 		done
# 	else
# 		polybar --reload example &
# 	fi
# 	;;
# esac
