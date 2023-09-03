#!/bin/bash

pid=$(xdotool search --class 'scratchpad')

if [ -z  $pid ]; then
	alacritty --class 'scratchpad'
else
	if [ ! -f /tmp/scratchpad ]; then
		touch /tmp/scratchpad && bspc node $pid --flag hidden=off -f
	elif [ -f /tmp/scratchpad ]; then
		rm /tmp/scratchpad && bspc node $pid --flag hidden=on
	fi
fi
