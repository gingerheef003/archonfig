#!/bin/bash

func=$1
iconBef="/usr/share/icons/Adwaita/32x32/status/audio-volume-"
iconAft="-symbolic.symbolic.png"
isMute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

show_volume () {
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/{print $5}' | tr -dc "[:digit:]")
	pactl set-sink-mute @DEFAULT_SINK@ false
	dunstify -i "$iconBef$1$iconAft" -a "Volume" -h string:x-dunst-stack-tag:volume -h int:value:$volume "$volume"
}

handle_mute () {
	if [[ $isMute == "yes" ]]; then
		show_volume high
	else
		pactl set-sink-mute @DEFAULT_SINK@ true
		dunstify -i "${iconBef}muted${iconAft}" -h string:x-dunst-stack-tag:volume -a "Volume" "Muted"
	fi
}

case $func in
	raise)
		pactl set-sink-volume @DEFAULT_SINK@ +5%
		show_volume high
		;;
	lower)
		pactl set-sink-volume @DEFAULT_SINK@ -5%
		show_volume low
		;;
	mute)
		handle_mute
		;;
esac
