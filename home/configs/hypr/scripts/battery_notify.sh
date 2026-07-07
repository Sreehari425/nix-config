#!/bin/bash

# Levels to check
thresholds=(20 15 10 8 6)
last_notified=0

while true; do
    # Get battery percentage and charging status
    # Note: Replace 'BAT0' with your actual battery name from /sys/class/power_supply/
    bat_status=$(cat /sys/class/power_supply/BAT0/status)
    bat_cap=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$bat_status" = "Discharging" ]; then
        for level in "${thresholds[@]}"; do
            if [ "$bat_cap" -le "$level" ] && [ "$last_notified" -ne "$level" ]; then
                notify-send -u critical "Battery Low" "Only $bat_cap% remaining! Plug in now." -i battery-caution
                last_notified=$level
                break
            fi
        done
    else
        # Reset tracker when plugged back in
        last_notified=0
    fi

    sleep 60 # Check every minute
done
