#!/bin/bash
# TURNS ON WIFI HOTSPOT (through ethernet)
rfkill list wlan
nmcli radio wifi
hSTATUS=$(nmcli radio wifi)
if nmcli connection show --active | grep --color=always Hotspot ; then
	echo "wifi hotspot already on"
elif [ "$hSTATUS" == "enabled" ]; then
	nmcli connection up Hotspot
	nmcli radio wifi
	rfkill list wlan
elif [ "$hSTATUS" == "disabled" ]; then
	nmcli radio wifi on
	sleep 0.5
	nmcli connection up Hotspot
	nmcli radio wifi
	rfkill list wlan
else
	echo "ERROR"
fi