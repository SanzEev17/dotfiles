#!/bin/zsh

options=" Shutdown\n Reboot\n󰍃 Logout\n Suspend\n⏼ Hibernate\n Lock"

selected_option=$(echo -e $options | rofi -dmenu -p "Power Menu" -theme ~/.config/rofi/power-menu.rasi)

case $selected_option in
    *Shutdown)
        systemctl poweroff
        ;;
    *Reboot)
        systemctl reboot
        ;;
    *Logout)
        hyprctl dispatch exit
        ;;
    *Suspend)
        systemctl suspend
        ;;
    *Hibernate)
        systemctl hibernate
        ;;
    *Lock)
        hyprlock
        ;;
    *)
        ;;
esac
