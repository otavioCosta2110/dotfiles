#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Monitor backlights (if supported) using brightnessctl

iDIR="$HOME/.config/swaync/icons"
notification_timeout=1000
step=10  # INCREASE/DECREASE BY THIS VALUE
BRIGHT_NOTIFICATION_ID=9999

# Get brightness
get_backlight() {
    brightnessctl -m | cut -d, -f4 | sed 's/%//' || echo 0
}

# Get brightness icon with Nerd Fonts
get_brightness_icon() {
    local brightness=$1
    if [[ "$brightness" -eq 0 ]]; then
        echo "󰃞"  # Very low brightness icon
    elif [[ "$brightness" -le 25 ]]; then
        echo "󰃝"  # Low brightness icon
    elif [[ "$brightness" -le 50 ]]; then
        echo "󰃟"  # Medium brightness icon
    elif [[ "$brightness" -le 75 ]]; then
        echo "󰃠"  # High brightness icon
    else
        echo "󰃡"  # Very high brightness icon
    fi
}

# Create progress bar with markup (same as volume script)
create_progress_bar() {
    local percentage=$1
    local filled=$(($percentage / 5))
    local empty=$((20 - $filled))
    local bar="<span foreground='#ffffff'>"
    
    for ((i=0; i<$filled; i++)); do
        bar+="󰝤"
    done
    
    bar+="</span><span foreground='#3f3f3f'>"
    
    for ((i=0; i<$empty; i++)); do
        bar+="󰝤"
    done
    
    bar+="</span>"
    echo "$bar"
}

# Notify (following volume script pattern)
notify_user() {
    local brightness_level=$(get_backlight)
    local icon=$(get_brightness_icon $brightness_level)
    local progress_bar=$(create_progress_bar $brightness_level)
    
    notify-send -c centered --replace-id=$BRIGHT_NOTIFICATION_ID \
        -h string:x-canonical-private-synchronous:brightness_notif \
        -t $notification_timeout \
        "" \
        "<span font='107'>$icon</span>   \n<b>Brightness: $brightness_level%</b>\n$progress_bar"
}

# Increase brightness
inc_brightness() {
    local current_brightness=$(get_backlight)
    local new_brightness=$((current_brightness + step))
    
    # Constrain brightness
    if [ "$new_brightness" -gt 100 ]; then
        new_brightness=100
    fi
    
    brightnessctl set "${new_brightness}%" && notify_user
}

# Decrease brightness
dec_brightness() {
    local current_brightness=$(get_backlight)
    local new_brightness=$((current_brightness - step))
    
    # Constrain brightness
    if [ "$new_brightness" -lt 5 ]; then
        new_brightness=5
    fi
    
    brightnessctl set "${new_brightness}%" && notify_user
}

# Set specific brightness
set_brightness() {
    local new_brightness="$1"
    
    # Validate and constrain brightness
    if [ "$new_brightness" -lt 5 ]; then
        new_brightness=5
    elif [ "$new_brightness" -gt 100 ]; then
        new_brightness=100
    fi
    
    brightnessctl set "${new_brightness}%" && notify_user
}

# Execute accordingly (following volume script pattern)
if [[ "$1" == "--get" ]]; then
    get_backlight
elif [[ "$1" == "--inc" ]]; then
    inc_brightness
elif [[ "$1" == "--dec" ]]; then
    dec_brightness
elif [[ "$1" == "--set" ]]; then
    if [ -z "$2" ] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
        echo "Error: --set requires a numeric argument (5-100)" >&2
        exit 1
    fi
    set_brightness "$2"
elif [[ "$1" == "--get-icon" ]]; then
    get_brightness_icon $(get_backlight)
else
    get_backlight
fi
