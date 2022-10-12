#!/bin/sh

sxhkd &
imwheel -b 45 &
#imwheel -b "4 5" &
exec bspwm
#exec startxfce4

#/usr/share/xsession    -- session path
