#!/bin/zsh

# W I N D O W  T I T L E 
YABAI_PATH=$(which yabai)
WINDOW_TITLE=$($YABAI_PATH -m query --windows --window | jq -r '.title')
LENGTH=25
if [[ ${#WINDOW_TITLE} -gt $LENGTH ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-$LENGTH)
  WINDOW_TITLE="$WINDOW_TITLE…"
fi

APP_TITLE=$($YABAI_PATH -m query --windows --window | jq -r ".app")

if [[ $WINDOW_TITLE = "" ]]; then
    if [[ $APP_TITLE = "" ]]; then
        TITLE=""
    else
        TITLE="${APP_TITLE}"
    fi
else
    CLEANED_WIN_TITLE=${WINDOW_TITLE//$APP_TITLE | /}
    CLEANED_WIN_TITLE=${CLEANED_WIN_TITLE// | $APP_TITLE/}
    CLEANED_WIN_TITLE=${CLEANED_WIN_TITLE//$APP_TITLE - /}
    CLEANED_WIN_TITLE=${CLEANED_WIN_TITLE//$APP_TITLE – /}
    CLEANED_WIN_TITLE=${CLEANED_WIN_TITLE// – $APP_TITLE/}
    CLEANED_WIN_TITLE=${CLEANED_WIN_TITLE// - $APP_TITLE/}
    if [[ $APP_TITLE = "$CLEANED_WIN_TITLE" ]]; then
        TITLE="${APP_TITLE}"
    else
        TITLE="${APP_TITLE} | ${CLEANED_WIN_TITLE}"
    fi
fi
sketchybar -m --set title label="$TITLE"
