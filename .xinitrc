#!/bin/sh

sxhkd &
imwheel -b 45 &
#imwheel -b "4 5" &
exec bspwm

#/usr/share/xsession    -- session path
