#!/bin/bash

sketchybar --add item spot_logo center \
	--set spot_logo icon= \
	label.drawing=on \
	icon.font="$FONT:Regular:22" \
	icon.padding_left=15 \
	icon.padding_right=15 \
	icon.color="$GREEN" 

sketchybar --add item spot center \
	--set spot update_freq=1 \
	icon.drawing=on \
	updates=on \
	script="$PLUGIN_DIR/spotify.sh" \
	background.padding_left=0

sketchybar --set spot associated_display=2,3
sketchybar --set spot_logo associated_display=2,3
