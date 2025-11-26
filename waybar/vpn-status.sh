#!/bin/bash

# VPN Status Script for Waybar
# Place in ~/.config/waybar/vpn-status.sh

CURRENT_FILE="/tmp/protonvpn-current"

# Check if VPN is running
if systemctl is-active --quiet "openvpn-client@*"; then
    if [ -f "$CURRENT_FILE" ]; then
        LOCATION=$(cat "$CURRENT_FILE" | cut -d'-' -f1 | tr '[:lower:]' '[:upper:]')
        echo "{\"text\":\" $LOCATION\",\"tooltip\":\"VPN Connected: $(cat $CURRENT_FILE)\",\"class\":\"connected\"}"
    else
        echo "{\"text\":\"\",\"tooltip\":\"VPN Connected\",\"class\":\"connected\"}"
    fi
else
    echo "{\"text\":\"󰷷\",\"tooltip\":\"VPN Disconnected\",\"class\":\"disconnected\"}"
fi
