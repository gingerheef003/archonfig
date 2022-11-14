#!/bin/bash

pids=$(xdotool search --class "scratchpad")

for pid in $pids; do
	bspc node $pid --flag hidden -f
done
