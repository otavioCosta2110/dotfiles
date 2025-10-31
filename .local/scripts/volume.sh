#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Scripts for volume controls for audio and mic 

notification_timeout=1000
# Static notification ID (can be any unique number)
VOLUME_NOTIFICATION_ID=9999
MIC_NOTIFICATION_ID=9998

# Get Volume
get_volume() {
    volume=$(pamixer --get-volume)
    is_muted="$(pamixer --get-mute)"
    if [[ "$volume" -eq "0" || "$is_muted" == "true" ]]; then
        echo "0"
    else
        echo "$volume"
    fi
}

# Get volume icon with Nerd Fonts
get_volume_icon() {
    local volume=$1
    if [[ "$volume" -eq 0 ]] || [[ "$volume" -eq 0 ]]; then
        echo "󰖁"  # Muted icon
    elif [[ "$volume" -le 40 ]]; then
        echo "󰕿"  # Low volume icon
    elif [[ "$volume" -le 75 ]]; then
        echo "󰖀"  # Medium volume icon
    else
        echo "󰕾"  # High volume icon
    fi
}

# Create progress bar with markup
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

notify_user() {
    local volume_level=$(get_volume)
    local icon=$(get_volume_icon $volume_level)
    local progress_bar=""
    
    progress_bar=$(create_progress_bar $volume_level)
    notify-send -c centered --replace-id=$VOLUME_NOTIFICATION_ID \
      -h string:x-canonical-private-synchronous:volume_notif \
      -t $notification_timeout \
      "" \
      "<span font='107'>$icon</span>\n<b>Volume: $volume_level%</b>\n$progress_bar"
}

# Increase Volume
inc_volume() {
    if [ "$(pamixer --get-mute)" == "true" ]; then
        toggle_mute
    else
        pamixer -i 5 --allow-boost --set-limit 100 && notify_user
    fi
}

# Decrease Volume
dec_volume() {
    if [ "$(pamixer --get-mute)" == "true" ]; then
        toggle_mute
    else
        pamixer -d 5 && notify_user
    fi
}

# Toggle Mute
toggle_mute() {
    if [ "$(pamixer --get-mute)" == "false" ]; then
        pamixer -m && notify_user
    elif [ "$(pamixer --get-mute)" == "true" ]; then
        pamixer -u && notify_user
    fi
}

# Get Mic Icon with Nerd Fonts
get_mic_icon() {
    if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        echo "󰍭"  # Mic muted icon
    else
        echo "󰍬"  # Mic active icon
    fi
}

# Get Microphone Volume
get_mic_volume() {
    volume=$(pamixer --default-source --get-volume)
    if [[ "$volume" -eq "0" ]] || [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        echo "0"
    else
        echo "$volume"
    fi
}

# Notify for Microphone with markup
notify_mic_user() {
    local volume=$(get_mic_volume)
    local icon=$(get_mic_icon)
    local progress_bar=""
    
    if [[ "$volume" == "Muted" ]]; then
        progress_bar=$(create_progress_bar 0)
        notify-send --replace-id=$MIC_NOTIFICATION_ID \
            -t $notification_timeout \
            -h string:x-canonical-private-synchronous:volume_notif \
            -u low \
            "<span font='24'>$icon</span>" \
            "<b>Microphone: Muted</b>\n$progress_bar"
    else
        progress_bar=$(create_progress_bar $volume)
        notify-send --replace-id=$MIC_NOTIFICATION_ID \
            -t $notification_timeout \
            -h string:x-canonical-private-synchronous:volume_notif \
            -u low \
            "<span font='24'>$icon</span>" \
            "<b>Microphone: $volume%</b>\n$progress_bar"
    fi
}

# Toggle Mic
toggle_mic() {
    if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
        pamixer --default-source -m && notify_mic_user
    elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        pamixer --default-source -u && notify_mic_user
    fi
}

# Increase MIC Volume
inc_mic_volume() {
    if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        toggle_mic
    else
        pamixer --default-source -i 5 && notify_mic_user
    fi
}

# Decrease MIC Volume
dec_mic_volume() {
    if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
        toggle_mic
    else
        pamixer --default-source -d 5 && notify_mic_user
    fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
    get_volume
elif [[ "$1" == "--inc" ]]; then
    inc_volume
elif [[ "$1" == "--dec" ]]; then
    dec_volume
elif [[ "$1" == "--toggle" ]]; then
    toggle_mute
elif [[ "$1" == "--toggle-mic" ]]; then
    toggle_mic
elif [[ "$1" == "--get-icon" ]]; then
    get_volume_icon $(get_volume | sed 's/%//')
elif [[ "$1" == "--get-mic-icon" ]]; then
    get_mic_icon
elif [[ "$1" == "--mic-inc" ]]; then
    inc_mic_volume
elif [[ "$1" == "--mic-dec" ]]; then
    dec_mic_volume
else
    get_volume
fi
