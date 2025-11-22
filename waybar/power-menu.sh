#!/bin/bash

entries="Logout\nSuspend\nReboot\nShutdown\nLock"

selected=$(echo -e "$entries" | wofi --dmenu --insensitive --prompt "Power Menu" --width 300 --height 250 --cache-file /dev/null)

case $selected in
  "Logout")
    hyprctl dispatch exit;;
  "Suspend")
    systemctl suspend;;
  "Reboot")
    systemctl reboot;;
  "Shutdown")
    systemctl poweroff;;
  "Lock")
    hyprlock;;
  *)
    exit 0;;
esac
