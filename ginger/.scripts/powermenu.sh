#!/bin/bash

shutdown=''
reboot=''
lock=''
logout=''

rofi_cmd() {
	rofi -dmenu \
		-theme $HOME/.config/rofi/powermenu.rasi

}

run_rofi() {
	echo -e "$shutdown\n$reboot\n$lock\n$logout" | rofi_cmd
}

chosen=$(run_rofi)
case $chosen in
	$shutdown)
		poweroff
		;;
	$reboot)
		reboot
		;;
	$lock)
		dm-tool lock
		;;
	$logout)
		bspc quit
		;;
	*)
		echo "No command chosen"
		;;
esac
