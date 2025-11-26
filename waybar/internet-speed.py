#!/usr/bin/env python3
import time
import json

def get_bytes(interface='eth0'):
    """Read network bytes from /proc/net/dev"""
    try:
        with open('/proc/net/dev', 'r') as f:
            for line in f:
                if interface in line:
                    data = line.split()
                    rx_bytes = int(data[1])
                    tx_bytes = int(data[9])
                    return rx_bytes, tx_bytes
    except:
        pass
    return 0, 0

def format_speed(bytes_per_sec):
    """Format bytes per second to MB/s"""
    mb_per_sec = bytes_per_sec / (1024 * 1024)
    return f"{mb_per_sec:.2f} "

def find_active_interface():
    """Find the active network interface"""
    try:
        with open('/proc/net/route', 'r') as f:
            for line in f:
                fields = line.split()
                if fields[1] == '00000000' and fields[7] == '00000000':
                    return fields[0]
    except:
        pass
    return 'eth0'

interface = find_active_interface()
rx1, tx1 = get_bytes(interface)
time.sleep(1)
rx2, tx2 = get_bytes(interface)

download_speed = rx2 - rx1
upload_speed = tx2 - tx1
total_speed = download_speed + upload_speed

# Format output for Waybar
text = f" {format_speed(total_speed)}"
tooltip = f"Interface: {interface}\nTotal: {format_speed(total_speed)}\nDownload: {format_speed(download_speed)}\nUpload: {format_speed(upload_speed)}"

output = {
    "text": text,
    "tooltip": tooltip,
    "class": "network-speed"
}

print(json.dumps(output))
