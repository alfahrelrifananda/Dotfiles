#!/usr/bin/env python3
import sys
import json
import subprocess

def get_player_status():
    try:
        # Get active player
        players = subprocess.run(
            ['playerctl', '-l'],
            capture_output=True,
            text=True
        ).stdout.strip().split('\n')
        
        if not players or players == ['']:
            return None
        
        # Prioritize spotify, then discord, then others
        player = None
        if 'spotify' in players:
            player = 'spotify'
        elif any('discord' in p.lower() for p in players):
            player = next(p for p in players if 'discord' in p.lower())
        else:
            player = players[0]
        
        # Get metadata
        status = subprocess.run(
            ['playerctl', '-p', player, 'status'],
            capture_output=True,
            text=True
        ).stdout.strip()
        
        artist = subprocess.run(
            ['playerctl', '-p', player, 'metadata', 'artist'],
            capture_output=True,
            text=True
        ).stdout.strip()
        
        title = subprocess.run(
            ['playerctl', '-p', player, 'metadata', 'title'],
            capture_output=True,
            text=True
        ).stdout.strip()
        
        # Determine icon
        if 'spotify' in player.lower():
            icon = 'spotify'
        elif 'discord' in player.lower():
            icon = 'discord'
        else:
            icon = 'default'
        
        # Format output
        if artist and title:
            text = f"{artist} - {title}"
        elif title:
            text = title
        else:
            text = "No media"
        
        # Add status indicator
        if status.lower() == 'playing':
            status_icon = ""
        elif status.lower() == 'paused':
            status_icon = ""
        else:
            status_icon = ""
        
        return {
            'text': f"{status_icon} {text}",
            'class': icon,
            'alt': player
        }
        
    except Exception as e:
        return None

def main():
    status = get_player_status()
    if status:
        print(json.dumps(status))
    else:
        print(json.dumps({'text': '', 'class': 'none'}))

if __name__ == '__main__':
    main()
