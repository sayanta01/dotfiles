#!/bin/sh

sxhkd &
imwheel -b 45 &
#imwheel -b "4 5" &
xrdb -load ~/.config/x11/xresources &
exec bspwm
