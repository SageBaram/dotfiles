#!/usr/bin/bash

SPACE_ICONS=("謹" "" "" "ﮅ" "" "龎" "" "阮")
SPACE_LABELS=("code" "web" "tools" "inbox" "web" "read" "messages" "music")

for i in "${!SPACE_ICONS[@]}"; do
	sid=$(($i + 1))
	sketchybar --add space space."$sid" left \
		--set space."$sid" associated_space="$sid" \
		icon="${SPACE_ICONS[i]}" \
		icon.font="$ICON_FONT" \
		icon.padding_left=4 \
		icon.padding_right=4 \
		icon.align=center \
		label="${SPACE_LABELS[i]}" \
		label.font="$TEXT_FONT" \
		label.color="$RED" \
		label.padding_right=4 \
		background.padding_left=5 \
		background.padding_right=5 \
		background.color="$SURFACE2" \
		background.corner_radius=5 \
		background.height=18 \
		background.drawing=off \
		label.drawing=on \
		script="$PLUGIN_DIR/space.sh"
done
