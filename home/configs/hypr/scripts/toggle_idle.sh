#!/usr/bin/env bash
if pgrep -x "hypridle" > /dev/null; then
    pkill hypridle
    notify-send "Auto-Sleep" "DISABLED (Screen stays on)" -i "caffeine-on"
else
    hypridle &
    disown
    notify-send "Auto-Sleep" "ENABLED (Sysyem will not idle)" -i "caffeine-off"
fi

pkill -RTMIN+10 waybar
