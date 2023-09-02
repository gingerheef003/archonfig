list=$(playerctl -l)
rofi_cmd() {
	echo "$list" | rofi -dmenu
}
player=$(rofi_cmd)
if [ "$player" == "" ]; then
	echo "$list" | head -1 > /tmp/playerctl_player
else
	echo "$player" > /tmp/playerctl_player
fi
