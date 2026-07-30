#!/usr/bin/env bash

if systemctl --user is-active --quiet hypridle.service; then
    systemctl --user stop hypridle.service
    notify-send "Auto-Sleep" "DISABLED (Screen stays on)" -i "caffeine-on"
else
    systemctl --user start hypridle.service
    notify-send "Auto-Sleep" "ENABLED (System will idle normally)" -i "caffeine-off"
fi

pkill -RTMIN+10 waybar
