#!/bin/zsh

ICON="$HOME/.config/mako/icons/picture.png"
DIR="$HOME/Pictures/Screenshots/"
NAME="Screenshot_$(date '+%Y-%m-%d-%H:%M:%S').jpg"

# Notify
send_notification() {
  notify-send -i "$ICON" "Screenshot Created" "$NAME"
}

# Fullscreen Screenshot
full_screen() {
  grim "$DIR$NAME" && send_notification
}

# Partial Screenshot
partial_screen() {
  grim -g "$(slurp)" "$DIR$NAME" && send_notification
}

# Execute accordingly
if [[ "$1" == "full" ]]; then
	full_screen
elif [[ "$1" == "partial" ]]; then
	partial_screen
fi
