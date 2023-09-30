#!/bin/bash
# TURNS OFF WIRED CONNECTION (through ethernet)
if ethtool eno1 2>/dev/null | grep --color=always 'Link detected: yes' ; then
	if nmcli connection show --active | grep --color=always ethernet ; then
		nmcli connection down iitm_ethernet
		sleep 0.5
		nmcli connection show | grep ethernet --color=always
	elif nmcli connection show | grep ethernet ; then
		echo "wired connection already off"
	else
		echo "Error"
	fi
else
	echo "ethernet cable not connected"
fi