#!/bin/bash

options="Change Wallpaper\nPower Off\nReboot\nSleep\nLock"

chosen=$(echo -e "$options" | rofi -dmenu -p "Choose an action")

WALLPAPER_DIR="$HOME/Pictures"

case "$chosen" in
    "Change Wallpaper")
        # Use rofi to select a wallpaper from the directory
        WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | rofi -dmenu -i -p "Select Wallpaper")

        # Check if the user selected a wallpaper
        if [ -z "$WALLPAPER" ]; then
            echo "No wallpaper selected!"
            exit 1
        fi

        # Clean up the wallpaper path to remove any extra spaces or newlines
        WALLPAPER=$(echo "$WALLPAPER" | xargs)

        # Set the wallpaper using nitrogen
        nitrogen --set-zoom-fill "$WALLPAPER" --save

	~/Dot/pywall/scripts/alacritty_pywal.sh

        # Apply pywal to generate colors from the wallpaper
        wal -i "$WALLPAPER"

        # Optional: Refresh any other components like polybar or bspwm that use pywal colors
        # pkill polybar && polybar your-config &
        # bspc wm -r

        echo "Wallpaper set and pywal colors applied!"
        ;;
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
