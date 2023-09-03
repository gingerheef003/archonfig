#!/bin/bash

func=$1
icon="/usr/share/icons/Adwaita/32x32/status/display-brightness-symbolic.symbolic.png"
file="/sys/class/backlight/intel_backlight/brightness"
maxB=$(cat /sys/class/backlight/intel_backlight/max_brightness)

function show_brightness {
	bPerc=$(($(cat $file) * 100 / maxB))
	dunstify -i $icon -a "Brightness" -h string:x-dunst-stack-tag:bness -h int:value:$bPerc "$bPerc%" "$1"
}

case $func in
	ac)
		echo $((maxB * 80 / 100)) > $file
		show_brightness "Plugged in"
		;;
	bat)
		echo $((maxB * 20 / 100)) > $file
		show_brightness "On Battery"
		;;
esac


