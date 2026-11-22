#!/bin/bash
CONFIG="$HOME/.config/ghostty/appearance"
TABS_CSS="$HOME/.config/ghostty/tabs.css"
CURRENT=$(grep '^background-opacity' "$CONFIG" | awk '{print $3}')

if [ "$CURRENT" = "1" ]; then
    NEW=0.8
else
    NEW=1
fi

sed -i "s/^background-opacity = .*/background-opacity = $NEW/" "$CONFIG"
sed -i "s/background-color: alpha(@background, [0-9.]*)/background-color: alpha(@background, $NEW)/" "$TABS_CSS"

pkill -USR2 -x ghostty
