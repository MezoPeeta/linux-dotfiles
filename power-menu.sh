#!/bin/bash

options="Power Off\nReboot\nSleep\nLock"

chosen=$(echo -e "$options" | rofi -dmenu -p "Choose an action")

case "$chosen" in
    "Power Off")
        systemctl poweroff
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Sleep")
        systemctl suspend
        ;;
    "Lock")
        betterlockscreen -l
        ;; 
    
esac
