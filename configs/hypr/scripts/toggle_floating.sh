#!/bin/bash

# to future some one who is reading this sounds stupid, but hyprland as of 0.54.3 dosent have globale floating/tiled toggle
# since hyprland hot reload this work around i found




FILE="$HOME/.config/hypr/float-toggle.lua"

if [ -s "$FILE" ]; then
    echo -n "" > "$FILE"
    notify-send "Spawn Mode" "Tiled"
else
    printf 'hl.window_rule({\n  name = "global-float-toggle",\n  match = { class = ".*" },\n  float = true,\n})\n' > "$FILE"
    notify-send "Spawn Mode" "Floating"
fi

hyprctl reload
