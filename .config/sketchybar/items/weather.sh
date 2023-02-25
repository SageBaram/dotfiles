#!/bin/bash

sketchybar --add item weather right
sketchybar --set weather label.font="$TEXT_FONT"
sketchybar --set weather script="$PLUGIN_DIR/weather.sh"
sketchybar --set weather label.padding_left=10
sketchybar --set weather icon.padding_left="$PADDING"
sketchybar --set weather update_freq=2
