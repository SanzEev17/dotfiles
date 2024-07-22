#!/bin/zsh

iDIR="$HOME/.config/mako/icons"

# Get the current volume level
get_volume() {
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
  echo "$volume"
}

# Get the mute status
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

#Get the current Microphone status
mic_status=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}')

# Get icons
get_icon() {
	current=$(get_volume)
	if [[ "$current" -eq "0" ]]; then
		echo "$iDIR/volume-mute.png"
	elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
		echo "$iDIR/volume-low.png"
	elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
		echo "$iDIR/volume-mid.png"
	elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
		echo "$iDIR/volume-high.png"
	fi
}

# Notify
send_notification() {
	notify-send -h int:value:"$(get_volume)%" -h string:x-canonical-private-synchronous:volume -u low -i "$(get_icon)" "Volume : $(get_volume) %"
}

# Increase Volume
inc_volume() {
  wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+ && send_notification
}

# Decrease Volume
dec_volume() {
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && send_notification
}

# Toggle Mute
toggle_mute() {
	if [ "$muted" == "[MUTED]" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$ICON_VOLUME_HIGH Volume Unmuted"
	else
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "$ICON_VOLUME_MUTE Volume Muted"
	fi
}

# Toggle Mic
toggle_mic() {
	if [ "$mic_status" == "[MUTED]" ]; then
		wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone.png" "Microphone Switched ON"
  else
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone-mute.png" "Microphone Switched OFF"
	fi
}

# Get icons
get_mic_icon() {
	current=$mic_status
	if [[ "$current" -eq "0" ]]; then
		echo "$iDIR/microphone.png"
	elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
		echo "$iDIR/microphone.png"
	elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
		echo "$iDIR/microphone.png"
	elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
		echo "$iDIR/microphone.png"
	fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle-mute" ]]; then
	toggle_mute
elif [[ "$1" == "--toggle-mic" ]]; then
	toggle_mic
elif [[ "$1" == "--get-icon" ]]; then
	get_icon
elif [[ "$1" == "--get-mic-icon" ]]; then
	get_mic_icon
else
	get_volume
fi
