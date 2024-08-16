#!/bin/sh

case "$3" in
	unplug)
		sudo -u ginger XDG_RUTIME_DIR=/run/user/1000 /home/ginger/.local/bin/headphone_plug_control.sh 0
		logger "Headphones unplugged"
		;;
	plug)
		sudo -u ginger XDG_RUTIME_DIR=/run/user/1000 /home/ginger/.local/bin/headphone_plug_control.sh 1
		logger "Headphones plugged"
		;;
	*) logger "ACPI action undefined: $1 / $3" ;;
esac
