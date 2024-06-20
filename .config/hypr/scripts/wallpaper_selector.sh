#!/bin/zsh

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
SCRIPT_DIR="$HOME/.config/hypr/scripts"

# List all image files in the wallpaper directory
files=$(ls "$WALLPAPER_DIR" | grep -E "\.(jpg|jpeg|png|bmp|webp)$")

# Use rofi to select a file with the custom configuration
selected=$(echo "$files" | rofi -dmenu -i -p "Select Wallpaper:")

# If a selection was made, set the wallpaper using swww
if [ -n "$selected" ]; then
    swww img "$WALLPAPER_DIR/$selected" && "$SCRIPT_DIR/wallpaper_blur.sh" "$WALLPAPER_DIR/$selected"
fi
