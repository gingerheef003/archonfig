#!/bin/bash

func=$1

bus=`dbus-send --session\
	--type=method_call\
	--print-reply=literal\
	--dest=org.freedesktop.DBus\
	/org/freedesktop/DBus\
	org.freedesktop.DBus.ListNames |
	tr ' ' '\n' |
	grep 'org.mpris.MediaPlayer2' |
	tail -n 1`

dbus-send --type=method_call --dest=$bus /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.$func
