#!/bin/bash

func=$1

function show_brightness {
	brightness=$(xbacklight -get | cut -d '.' -f 1)	
	dunstify -r 548565 -a "Brightness" -h int:value:$brightness "BRIGHTNESS: $brightness%"
}

case $func in
	up)
		xbacklight -inc 5
		show_brightness
		;;
	down)
		xbacklight -dec 5
		show_brightness
		;;
esac
