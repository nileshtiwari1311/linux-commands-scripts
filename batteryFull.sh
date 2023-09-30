#!/usr/bin/env bash
while true
    do
        export DISPLAY=:0.0
        battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
        if on_ac_power; then                                    #check if AC is plugged in
            if [ "$battery_percent" -gt 95 ]; then              #check if the battery level is over 90%
                notify-send -u critical -i battery-full-charged "Battery level above 95%" "Please unplug your AC adapter"
                paplay /usr/share/sounds/freedesktop/stereo/complete.oga
            fi
        fi
        sleep 300 # (5 minutes)                                 #wait for 300 seconds before checking again
    done