#!/bin/bash

sketchybar --add item date right
sketchybar --set date label.font="$TEXT_FONT"
sketchybar --set date script='sketchybar --set date label="$(date "+%m/%d/%y (%a)")"'
sketchybar --set date label.padding_left="$PADDING"
sketchybar --set date update_freq=4
