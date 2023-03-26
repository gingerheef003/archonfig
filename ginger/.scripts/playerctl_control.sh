list=$(playerctl -l)
rofi_cmd() {
	$list | rofi -dmenu
}
player="$(rofi_cmd)"
if [ "$player" == "" ]; then
	echo $(echo $list | head -1) > /tmp/playerctl_player
else
	echo $(player) > /tmp/playerctl_player
fi
