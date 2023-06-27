#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u "$(id -u)" -x polybar >/dev/null; do sleep 1; done

desktop=$DESKTOP_SESSION
# count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)

case $desktop in

bspwm | /usr/share/xsessions/bspwm)
	if type "xrandr" >/dev/null; then
		for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
			MONITOR=$m polybar --reload example -c ~/.config/polybar/config.ini &
		done
	else
		polybar --reload example -c ~/.config/polybar/config.ini &
	fi
	;;
esac
