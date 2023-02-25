#!/bin/bash

CPU_SCRIPT='
CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USE=$(printf "%02.0f"\\n "$(echo "$CPU_SYS*100"  | bc -l)")
sketchybar --set cpu label="CPU: ${CPU_USE}%"
'

sketchybar --add item cpu right
sketchybar --set cpu label.font="$TEXT_FONT"
sketchybar --set cpu label.color="$PEACH"
sketchybar --set cpu script="$CPU_SCRIPT"
sketchybar --set cpu update_freq=2
sketchybar --set cpu label.padding_left="$PADDING"
sketchybar --set cpu associated_display=1

