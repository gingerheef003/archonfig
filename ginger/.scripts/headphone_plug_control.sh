#!/bin/sh

icon="/usr/share/icons/Adwaita/32x32/devices/audio-headphones-symbolic.symbolic.png"

case $1 in
	0)
		sudo -u ginger DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/ginger/.scripts/media_control.sh "Pause"
		dunstify -i $icon -h string:x-dunst-stack-tag:headphone -a "Headphone" "Headphones Disconnected"
		;;
	1)
		dunstify -i $icon -h string:x-dunst-stack-tag:headphone -a "Headphone" "Headphones Connected"
		;;
esac
