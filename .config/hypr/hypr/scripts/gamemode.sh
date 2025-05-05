#!/usr/bin/env sh

CONFIG_BACKUP="$HOME/.hyprgame_mode_backup"
NOTIF_HINT="gamemode_notif"  
icon="$HOME/.config/swaync/icons/snes-gamepad.png"

if [ -f "$CONFIG_BACKUP" ]; then
    hyprctl reload
    rm "$CONFIG_BACKUP"
    notify-send -e -h string:x-canonical-private-synchronous:$NOTIF_HINT -i $icon -u low " Gamemode Off"
else
    hyprctl getoption animations:enabled > "$CONFIG_BACKUP"
    hyprctl getoption decoration:shadow:enabled >> "$CONFIG_BACKUP"
    hyprctl getoption decoration::enabled >> "$CONFIG_BACKUP"
    hyprctl getoption decoration:blur:enabled >> "$CONFIG_BACKUP"
    hyprctl getoption general:gaps_in >> "$CONFIG_BACKUP"
    hyprctl getoption general:gaps_out >> "$CONFIG_BACKUP"
    hyprctl getoption general:border_size >> "$CONFIG_BACKUP"
    hyprctl getoption decoration:rounding >> "$CONFIG_BACKUP"
    
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"

    notify-send -e -h string:x-canonical-private-synchronous:$NOTIF_HINT -i $icon -u low " Gamemode On"
fi
