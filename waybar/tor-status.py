#!/usr/bin/env python3
import json
import subprocess
import urllib.request
import urllib.error

def check_tor_service():
    """Check if Tor service is running"""
    try:
        result = subprocess.run(
            ['systemctl', 'is-active', 'tor'],
            capture_output=True,
            text=True,
            timeout=2
        )
        return result.stdout.strip() == 'active'
    except:
        return False

def check_tor_connection():
    """Check if actually connected through Tor network"""
    try:
        # Try to get IP through Tor check API
        req = urllib.request.Request(
            'https://check.torproject.org/api/ip',
            headers={'User-Agent': 'Mozilla/5.0'}
        )
        with urllib.request.urlopen(req, timeout=5) as response:
            data = json.loads(response.read().decode())
            return data.get('IsTor', False)
    except:
        return False

def check_bootstrap():
    """Check Tor bootstrap status"""
    try:
        result = subprocess.run(
            ['journalctl', '-u', 'tor', '-n', '50', '--no-pager'],
            capture_output=True,
            text=True,
            timeout=2
        )
        lines = result.stdout.strip().split('\n')
        
        for line in reversed(lines):
            if 'Bootstrapped 100%' in line:
                return 100
            elif 'Bootstrapped' in line:
                # Extract percentage
                try:
                    percent = line.split('Bootstrapped ')[1].split('%')[0]
                    return int(percent)
                except:
                    pass
        return 0
    except:
        return 0

# Check Tor status
tor_service = check_tor_service()
bootstrap_percent = check_bootstrap() if tor_service else 0
tor_connected = check_tor_connection() if bootstrap_percent == 100 else False

# Determine status
if tor_connected:
    icon = ""
    text = ""
    status_class = "tor-active"
    tooltip = "Tor network is active\nYour traffic is anonymized"
elif tor_service and bootstrap_percent > 0:
    icon = ""
    text = f"{bootstrap_percent}%"
    status_class = "tor-connecting"
    tooltip = f"Tor is connecting...\nBootstrap: {bootstrap_percent}%"
elif tor_service:
    icon = "󰥔"
    text = ""
    status_class = "tor-starting"
    tooltip = "Tor service is starting..."
else:
    icon = ""
    text = ""
    status_class = "tor-off"
    tooltip = "Tor is not running\nClick to start"

# Format output
output = {
    "text": f"{icon} {text}",
    "tooltip": tooltip,
    "class": status_class,
    "percentage": bootstrap_percent
}

print(json.dumps(output))
