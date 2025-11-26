#!/usr/bin/env python3
import json
import subprocess
import urllib.request
import urllib.error
import os
import sys
from pathlib import Path

# State file to track previous status
STATE_FILE = Path.home() / '.cache' / 'tor_status_state.json'

def toggle_tor_service():
    """Toggle Tor service on/off"""
    try:
        # Check current status
        result = subprocess.run(
            ['systemctl', 'is-active', 'tor'],
            capture_output=True,
            text=True,
            timeout=2
        )
        is_active = result.stdout.strip() == 'active'
        
        if is_active:
            # Stop Tor
            subprocess.run(['sudo', 'systemctl', 'stop', 'tor'], timeout=5, check=True)
        else:
            # Start Tor
            subprocess.run(['sudo', 'systemctl', 'start', 'tor'], timeout=5, check=True)
    except Exception as e:
        pass

# Handle click events
if len(sys.argv) > 1 and sys.argv[1] == 'toggle':
    toggle_tor_service()
    sys.exit(0)

def load_previous_state():
    """Load previous state from file"""
    try:
        if STATE_FILE.exists():
            with open(STATE_FILE, 'r') as f:
                return json.load(f)
    except:
        pass
    return {'status': None, 'bootstrap': 0}

def save_state(status, bootstrap):
    """Save current state to file"""
    try:
        STATE_FILE.parent.mkdir(parents=True, exist_ok=True)
        with open(STATE_FILE, 'w') as f:
            json.dump({'status': status, 'bootstrap': bootstrap}, f)
    except:
        pass

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
                try:
                    percent = line.split('Bootstrapped ')[1].split('%')[0]
                    return int(percent)
                except:
                    pass
        return 0
    except:
        return 0

# Load previous state
prev_state = load_previous_state()

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
    current_status = "connected"
elif tor_service and bootstrap_percent > 0:
    icon = "󰴻"
    text = ""
    status_class = "tor-connecting"
    tooltip = f"Tor is connecting...\nBootstrap: {bootstrap_percent}%"
    current_status = "connecting"
elif tor_service:
    icon = "󰇘"
    text = ""
    status_class = "tor-starting"
    tooltip = "Tor service is starting..."
    current_status = "starting"
else:
    icon = ""
    text = ""
    status_class = "tor-off"
    tooltip = "Tor is not running\nClick to start"
    current_status = "off"

# Save current state
save_state(current_status, bootstrap_percent)

# Format output
output = {
    "text": f"{icon} {text}",
    "tooltip": tooltip,
    "class": status_class,
    "percentage": bootstrap_percent
}

print(json.dumps(output))

