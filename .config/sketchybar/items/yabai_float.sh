#!/usr/bin/bash

sketchybar --add item yabai_float right
sketchybar --set yabai_float script="$PLUGIN_DIR/yabai_float.sh"
sketchybar --set yabai_float label.font="$TEXT_FONT"
sketchybar --set yabai_float label.padding_right=10
sketchybar --set yabai_float label.padding_left=10
sketchybar --set yabai_float associated_display=1
sketchybar --subscribe yabai_float yabai_window
