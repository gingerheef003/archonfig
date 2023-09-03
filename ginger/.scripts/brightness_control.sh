#!/bin/bash

func=$1
icon="/usr/share/icons/Adwaita/32x32/status/display-brightness-symbolic.symbolic.png"
file="/sys/class/backlight/intel_backlight/brightness"
maxB=$(cat /sys/class/backlight/intel_backlight/max_brightness)

bness=$(cat $file)

function show_brightness {
	bPerc=$((bness * 100 / maxB))
	dunstify -i $icon -a "Brightness" -h string:x-dunst-stack-tag:bness -h int:value:$bPerc "$bPerc%"
}

case $func in
	up)
		((bness+=maxB / 20))
		echo $bness > $file
		;;
	down)
		((bness-=maxB / 20))
		echo $bness > $file
		;;
esac

show_brightness
