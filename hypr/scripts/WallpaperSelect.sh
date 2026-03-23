#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Ensure the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
	echo "Wallpaper directory $WALLPAPER_DIR does not exist!"
	exit 1
fi

# Use find to list image files and wofi to select one
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | wofi --show dmenu --prompt "Select a wallpaper")

# Check if a wallpaper was selected
if [ -n "$SELECTED_WALLPAPER" ]; then
	# Set the wallpaper using swww
	swww img "$SELECTED_WALLPAPER" --transition-type wipe --transition-fps 60

	# Run wallust to generate colors and apply the template
	wallust run "$SELECTED_WALLPAPER"

	# Restart Cava to apply the new configuration
	pkill cava
	cava &
else
	echo "No wallpaper selected."
	exit 1
fi
