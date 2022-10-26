#!/bin/bash

func=$1
msgTag="volume_notif"
icon="/usr/share/icons/Adwaita/32x32/status/audio-volume-high-symbolic.symbolic.png"

function show_volume {
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/{print $5}' | tr -dc "[:digit:]")
	dunstify -r 548566 -i $icon -a "Volume" -h int:value:$volume "$volume"
}

#pactl set-sink-volume @DEFAULT_SINK@ {$func}2%

case $func in
	raise)
		pactl set-sink-volume @DEFAULT_SINK@ +5%
		;;
	lower)
		pactl set-sink-volume @DEFAULT_SINK@ -5%
		;;
esac

show_volume

