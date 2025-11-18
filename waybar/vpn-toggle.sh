#!/bin/bash

# VPN Toggle Script for ProtonVPN with Random Server Selection
# Place in ~/.config/waybar/vpn-toggle.sh

CONFIGS=("ca-free" "jp-free" "no-free")
STATE_FILE="/tmp/protonvpn-state"
CURRENT_FILE="/tmp/protonvpn-current"

# Check if any VPN is running
is_vpn_running() {
    systemctl is-active --quiet "openvpn-client@*"
}

# Stop all VPN connections
stop_vpn() {
    for config in "${CONFIGS[@]}"; do
        sudo systemctl stop "openvpn-client@${config}" 2>/dev/null
    done
    rm -f "$STATE_FILE" "$CURRENT_FILE"
}

# Start random VPN
start_vpn() {
    # Pick a random config
    RANDOM_CONFIG="${CONFIGS[$RANDOM % ${#CONFIGS[@]}]}"
    
    # Start the VPN
    sudo systemctl start "openvpn-client@${RANDOM_CONFIG}"
    
    # Save state
    echo "connected" > "$STATE_FILE"
    echo "$RANDOM_CONFIG" > "$CURRENT_FILE"
}

# Main toggle logic
if is_vpn_running; then
    stop_vpn
    echo "VPN disconnected"
else
    start_vpn
    echo "VPN connected to $(cat $CURRENT_FILE)"
fi
