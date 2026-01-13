#!/bin/bash

# Screen capture detection and control script for Waybar
# Detects if screen is being captured and can toggle GPU screen recorder

ICON_CAPTURED=" 󰻂 "
ICON_FREE="  "
ICON_RECORDING=" 󰻂 "
ICON_SHARED=" 󱒃 "

# State file to track recording status
STATE_FILE="$HOME/.config/waybar/.screen_recorder_state"
VIDEOS_DIR="$HOME/Videos"

# Create state file if it doesn't exist
mkdir -p "$(dirname "$STATE_FILE")"
mkdir -p "$VIDEOS_DIR"

# Check for active PipeWire screen sharing sessions
check_pipewire_screencast() {
    # Check if pw-dump is available
    if ! command -v pw-dump > /dev/null 2>&1; then
        return 1
    fi

    # Check for active screen capture nodes in PipeWire
    if command -v jq > /dev/null 2>&1; then
        # Use jq for more precise detection
        local screencast_nodes=$(pw-dump 2>/dev/null | jq -r '
            .[] | 
            select(.info.props."node.name" and (
                (.info.props."node.name" | test("xdg-desktop-portal|screencast|capture|share")) or
                (.info.props."media.class" == "Video/Source") or
                (.info.props."media.role" == "Capture")
            )) | .info.props."node.name"
        ' 2>/dev/null)
        
        if [ -n "$screencast_nodes" ] && [ "$screencast_nodes" != "null" ]; then
            # Additional check for active stream state
            local active_streams=$(pw-dump 2>/dev/null | jq -r '
                .[] | 
                select(.info.state == "running" and .info.props."media.class" == "Video/Source")
            ' 2>/dev/null)
            
            if [ -n "$active_streams" ] && [ "$active_streams" != "null" ]; then
                # Try to identify the application
                local app_name=$(echo "$screencast_nodes" | head -1 | cut -d'.' -f1)
                case "$app_name" in
                    "discord"|"Discord")
                        echo "{\"text\": \"$ICON_SHARED\", \"tooltip\": \"Screen is being shared (Discord)\", \"class\": \"capturing\"}"
                        ;;
                    "firefox"|"Firefox")
                        echo "{\"text\": \"$ICON_SHARED\", \"tooltip\": \"Screen is being shared (Firefox)\", \"class\": \"capturing\"}"
                        ;;
                    "chrome"|"chromium"|"Chrome"|"Chromium")
                        echo "{\"text\": \"$ICON_SHARED\", \"tooltip\": \"Screen is being shared (Chrome/Chromium)\", \"class\": \"capturing\"}"
                        ;;
                    "zoom"|"Zoom")
                        echo "{\"text\": \"$ICON_SHARED\", \"tooltip\": \"Screen is being shared (Zoom)\", \"class\": \"capturing\"}"
                        ;;
                    "teams"|"Teams")
                        echo "{\"text\": \"$ICON_SHARED\", \"tooltip\": \"Screen is being shared (Teams)\", \"class\": \"capturing\"}"
                        ;;
                    *)
                        echo "{\"text\": \"$ICON_SHARED\", \"tooltip\": \"Screen is being shared\", \"class\": \"capturing\"}"
                        ;;
                esac
                return 0
            fi
        fi
    else
        # Fallback without jq - basic grep approach
        local pipewire_output=$(pw-dump 2>/dev/null)
        if echo "$pipewire_output" | grep -q "screencast\|capture\|share"; then
            echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"Screen is being shared\", \"class\": \"capturing\"}"
            return 0
        fi
    fi

    # Check for active portal sessions via DBus
    if command -v gdbus > /dev/null 2>&1; then
        local portal_sessions=$(gdbus call --session --dest org.freedesktop.portal.Desktop --object-path /org/freedesktop/portal/desktop --method org.freedesktop.portal.Request.Close 2>/dev/null)
        if [ $? -eq 0 ] && [ -n "$portal_sessions" ]; then
            echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"Screen sharing portal active\", \"class\": \"capturing\"}"
            return 0
        fi
    fi

    return 1
}

# Check for active screen capture sessions
check_capture() {
    # Check for GPU Screen Recorder first
    if pgrep -f "gpu-screen-recorder" > /dev/null 2>&1; then
        # Check if we are currently recording (check state file)
        if [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "recording" ]; then
            echo "{\"text\": \"$ICON_RECORDING\", \"tooltip\": \"Recording with GPU Screen Recorder (click to stop)\", \"class\": \"recording\"}"
        else
            echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"GPU Screen Recorder is active\", \"class\": \"capturing\"}"
        fi
        return
    fi

    # Check for OBS Studio
    if pgrep -f "obs" > /dev/null 2>&1; then
        if pgrep -f "obs.*--startrecording" > /dev/null 2>&1 || pgrep -f "obs.*--startstreaming" > /dev/null 2>&1; then
            echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"Screen is being captured (OBS)\", \"class\": \"capturing\"}"
            return
        fi
    fi

    # Check for SimpleScreenRecorder
    if pgrep -f "ssr-gtk" > /dev/null 2>&1; then
        echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"Screen is being captured (SimpleScreenRecorder)\", \"class\": \"capturing\"}"
        return
    fi

    # Check for Kazam
    if pgrep -f "kazam" > /dev/null 2>&1; then
        echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"Screen is being captured (Kazam)\", \"class\": \"capturing\"}"
        return
    fi

    # Check for GNOME Screen Recording (Ctrl+Alt+Shift+R)
    if dbus-send --session --dest=org.gnome.Shell --type=method_call /org/gnome/Shell org.gnome.Shell.Eval string:'Main.screenRecorder._recording' 2>/dev/null | grep -q "true"; then
        echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"Screen is being captured (GNOME)\", \"class\": \"capturing\"}"
        return
    fi

    # Check for wf-recorder (Wayland)
    if pgrep -f "wf-recorder" > /dev/null 2>&1; then
        echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"Screen is being captured (wf-recorder)\", \"class\": \"capturing\"}"
        return
    fi

    # Check for vokoscreenNG
    if pgrep -f "vokoscreenNG" > /dev/null 2>&1; then
        echo "{\"text\": \"$ICON_CAPTURED\", \"tooltip\": \"Screen is being captured (vokoscreenNG)\", \"class\": \"capturing\"}"
        return
    fi

    # Check for active PipeWire screen sharing sessions
    check_pipewire_screencast

    # No capture detected
    echo "{\"text\": \"$ICON_FREE\", \"tooltip\": \"Click to start recording with GPU Screen Recorder\", \"class\": \"idle\"}"
}

# Toggle GPU Screen Recorder
toggle_recording() {
    if pgrep -f "gpu-screen-recorder" > /dev/null 2>&1; then
        # Stop recording
        pkill -SIGINT -f "gpu-screen-recorder"
        echo "stopped" > "$STATE_FILE"
        # Send signal to update Waybar
        pkill -RTMIN+10 waybar
    else
        # Start recording
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        OUTPUT_FILE="$VIDEOS_DIR/recording_$TIMESTAMP.mp4"
        
        # Start GPU Screen Recorder in background
        gpu-screen-recorder -w screen -f 60 -a default_output -o "$OUTPUT_FILE" &
        
        # Save recording state
        echo "recording" > "$STATE_FILE"
        
        # Send signal to update Waybar
        pkill -RTMIN+10 waybar
        
        # Show notification (optional)
        if command -v notify-send > /dev/null 2>&1; then
            notify-send "Screen Recording Started" "Recording to $OUTPUT_FILE"
        fi
    fi
}

# Handle command line arguments
case "$1" in
    "toggle")
        toggle_recording
        ;;
    *)
        check_capture
        ;;
esac
