#!/bin/bash

sketchybar --add item batt right
sketchybar --set batt label.font="$TEXT_FONT"
sketchybar --set batt icon.padding_left="$PADDING"
sketchybar --set batt label.padding_left=10
sketchybar --set batt script="$PLUGIN_DIR/battery.sh"
sketchybar --set batt update_freq=10
