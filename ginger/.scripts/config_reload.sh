#!/bin/bash

file=$1
icon="/usr/share/icons/Adwaita/32x32/emblems/emblem-documents-symbolic.symbolic.png"

dunstify -i $icon -a "Config Reload" -h string:x-dunst-stack-tag:"$file config" $file "Reloaded Config" 
