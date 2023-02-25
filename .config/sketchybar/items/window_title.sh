#!/usr/bin/bash

sketchybar --add item title center 
sketchybar --set title label.font="$TEXT_FONT"
sketchybar --set title label.color="$LAVENDER"
sketchybar --set title script="$PLUGIN_DIR/window_title.sh"
sketchybar --set title associated_display=1
sketchybar --subscribe title yabai_window
