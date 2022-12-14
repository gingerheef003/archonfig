#!/bin/bash

n=$(echo $(($RANDOM % 5 + 1)))
case $n in
	1)
		asciiquarium
		;;
	2)
		cmatrix -ab
		;;
	3)
		fortune | cowsay -f $(ls /usr/share/cows | shuf -n1) | lolcat
		;;
	4)
		neofetch
		;;
	5)
		sl -aeG
		;;
esac
