#!/bin/bash
# TURNS OFF WIFI HOTSPOT (through ethernet) AND WIFI ALSO
rfkill list wlan
nmcli radio wifi
if nmcli connection show --active | grep --color=always Hotspot ; then
	nmcli connection down Hotspot
	sleep 0.5
	nmcli radio wifi off
	nmcli radio wifi
	rfkill list wlan
else
	echo "wifi hotspot already off"
fi