#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Monitor backlights (if supported) using brightnessctl

iDIR="$HOME/.config/swaync/icons"
notification_timeout=1000
step=10  # INCREASE/DECREASE BY THIS VALUE

# Get brightness
get_backlight() {
    brightnessctl -m | cut -d, -f4 | sed 's/%//' || echo 0
}

# Get icons
get_icon() {
    current=$(get_backlight)
    if   [ "$current" -le "20" ]; then
        icon="$iDIR/brightness-20.png"
    elif [ "$current" -le "40" ]; then
        icon="$iDIR/brightness-40.png"
    elif [ "$current" -le "60" ]; then
        icon="$iDIR/brightness-60.png"
    elif [ "$current" -le "80" ]; then
        icon="$iDIR/brightness-80.png"
    else
        icon="$iDIR/brightness-100.png"
    fi
    
    # Fallback if icon doesn't exist
    [ ! -f "$icon" ] && icon=""
}

# Notify
notify_user() {
    notify-send -t $notification_timeout \
        -h string:x-canonical-private-synchronous:brightness_notif \
        -h int:value:"$current" \
        -u low \
        -i "$icon" \
        "Screen" "Brightness: $current%"
}

# Change brightness
change_backlight() {
    local current_brightness=$(get_backlight)
    local new_brightness

    case "$1" in
        "+"*)  # Increase
            new_brightness=$((current_brightness + step))
            ;;
        "-"*)  # Decrease
            new_brightness=$((current_brightness - step))
            ;;
        *)     # Set specific value
            new_brightness="$1"
            ;;
    esac

    # Validate and constrain brightness
    if [ "$new_brightness" -lt 5 ]; then
        new_brightness=5
    elif [ "$new_brightness" -gt 100 ]; then
        new_brightness=100
    fi

    brightnessctl set "${new_brightness}%" || {
        echo "Error: Failed to set brightness. Try running with sudo?" >&2
        exit 1
    }

    get_icon
    current="$new_brightness"
    notify_user
}

# Execute accordingly
case "$1" in
    "--get")
        get_backlight
        ;;
    "--inc")
        change_backlight "+"
        ;;
    "--dec")
        change_backlight "-"
        ;;
    "--set")
        if [ -z "$2" ] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
            echo "Error: --set requires a numeric argument (5-100)" >&2
            exit 1
        fi
        change_backlight "$2"
        ;;
    *)
        get_backlight
        ;;
esac
