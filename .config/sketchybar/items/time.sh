#!/bin/bash

sketchybar --add item time right
sketchybar --set time label.font="$TEXT_FONT"
sketchybar --set time script='sketchybar --set time label="$(date "+%I:%M%p")"'
sketchybar --set time label.padding_left="$PADDING"
sketchybar --set time update_freq=2
