if [ $(cat /sys/class/power_supply/AC0/online) == 1 ]; then
	$HOME/.scripts/brightness_control_acpi.sh ac
else
	$HOME/.scripts/brightness_control_acpi.sh bat
fi
