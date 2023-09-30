#!/bin/bash
# TURNS ON WIRED CONNECTION (through ethernet)
if ethtool eno1 2>/dev/null | grep --color=always 'Link detected: yes' ; then
	if nmcli connection show --active | grep --color=always ethernet ; then
		echo "wired connection already on"
	elif nmcli connection show | grep ethernet ; then
		nmcli connection up iitm_ethernet
		sleep 0.5
		nmcli connection show --active | grep ethernet --color=always
	else
		echo "Error"
	fi
else
	echo "ethernet cable not connected"
fi