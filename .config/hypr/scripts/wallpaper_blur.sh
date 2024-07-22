#!/bin/zsh

iPATH="$HOME/.config/mako/icons/picture.png"

# Path to the wallpaper
WALLPAPER_PATH=$1

# Directory to save the processed images
OUTPUT_DIR=$HOME/.cache/

# Filenames for the processed images
BLURRED_IMAGE=$OUTPUT_DIR/blurred_wallpaper.png
SQUARE_WALLPAPER=$OUTPUT_DIR/square_wallpaper.png

# Remove existing images if they exist
[ -f "$BLURRED_IMAGE" ] && rm "$BLURRED_IMAGE"
[ -f "$SQUARE_WALLPAPER" ] && rm "$SQUARE_WALLPAPER"

# Send notification about blurring start
notify-send -i "$iPATH" "Wallpaper Processor" "Blurring the wallpaper..."

# Create blurred version
convert "$WALLPAPER_PATH" -blur 0x12 "$BLURRED_IMAGE"

# Send notification about cropping start
notify-send -i "$iPATH" "Wallpaper Processor" "Cropping the wallpaper..."

# Create cropped 1:1 version
convert "$WALLPAPER_PATH" -gravity center -crop 1:1 "$SQUARE_WALLPAPER"

# Optionally, resize the cropped image to a standard size (e.g., 256x256)
convert "$SQUARE_WALLPAPER" -resize 256x256 "$SQUARE_WALLPAPER"

# Send notification about completion
notify-send -i "$iPATH" "Wallpaper Processor" "Processing completed. Images saved."

