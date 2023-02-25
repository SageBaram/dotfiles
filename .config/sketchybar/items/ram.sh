#!/bin/bash

RAM_SCRIPT='sketchybar -m --set ram label="RAM: $(memory_pressure | grep "System-wide memory free percentage:" | awk "{ print 100-\$5 }")%"'
sketchybar --add item ram right
sketchybar --set ram label.font="$TEXT_FONT"
sketchybar --set ram label.color="$PEACH"
sketchybar --set ram label.padding_left="$PADDING"
sketchybar --set ram script="$RAM_SCRIPT"
sketchybar --set ram update_freq=2
sketchybar --set ram associated_display=1
