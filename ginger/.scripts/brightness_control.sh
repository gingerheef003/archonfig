#!/bin/bash

func=$1
icon="/usr/share/icons/Adwaita/32x32/status/display-brightness-symbolic.symbolic.png"

function show_brightness {
	brightness=$(xbacklight -get | cut -d '.' -f 1)	
	dunstify -r 548565 -i $icon -a "Brightness" -h int:value:$brightness "$brightness%"
}

case $func in
	up)
		xbacklight -inc 5
		;;
	down)
		xbacklight -dec 5
		;;
esac

show_brightness
