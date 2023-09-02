l=$(pacman -Qu | wc -l)
if [ "$l" -ne "0" ]
then
	alacritty --hold -e `sudo pacman -Syu`
fi
