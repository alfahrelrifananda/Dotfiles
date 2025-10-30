#!/bin/bash

# Waybar theme toggle script
# Toggle between dark and light mode by swapping CSS files

CONFIG_DIR="$HOME/.config/waybar"
STYLE_CSS="$CONFIG_DIR/style.css"
LIGHT_CSS="$CONFIG_DIR/style-light.css"
MARKER="$CONFIG_DIR/.theme-mode"

# Check if light mode CSS exists
if [ ! -f "$LIGHT_CSS" ]; then
  echo "Error: Light mode CSS not found at $LIGHT_CSS"
  echo "Please create style-light.css first"
  exit 1
fi

# Check current mode from marker file
if [ -f "$MARKER" ]; then
  CURRENT_MODE=$(cat "$MARKER")
else
  CURRENT_MODE="dark"
fi

if [ "$CURRENT_MODE" = "light" ]; then
  # Currently light, switch to dark
  # Restore from backup or use the original dark theme
  if [ -f "$CONFIG_DIR/style-dark-backup.css" ]; then
    cp "$CONFIG_DIR/style-dark-backup.css" "$STYLE_CSS"
  fi
  echo "dark" >"$MARKER"
  echo "Switched to dark mode"
else
  # Currently dark, switch to light
  # Backup current dark theme if not already backed up
  if [ ! -f "$CONFIG_DIR/style-dark-backup.css" ]; then
    cp "$STYLE_CSS" "$CONFIG_DIR/style-dark-backup.css"
  fi
  cp "$LIGHT_CSS" "$STYLE_CSS"
  echo "light" >"$MARKER"
  echo "Switched to light mode"
fi

# Reload waybar
killall -SIGUSR2 waybar
