#!/bin/bash

# Check for common screen recording processes
recording_processes=(
    "obs"
    "ffmpeg"
    "vokoscreen"
    "kazam"
    "simplescreenrecorder"
    "recordmydesktop"
    "wl-screenrec"
    "wf-recorder"
)

# Check if any recording process is running
is_recording=false
for process in "${recording_processes[@]}"; do
    if pgrep -f "$process" > /dev/null; then
        is_recording=true
        break
    fi
done

# Also check for GNOME/ KDE screen recording portals
if dbus-send --session --dest=org.freedesktop.portal.Desktop --print-reply /org/freedesktop/portal/desktop/org/freedesktop/portal/desktop/ScreenCast org.freedesktop.DBus.Properties.Get string:'org.freedesktop.portal.ScreenCast' string:'version' 2>/dev/null | grep -q 'uint32'; then
    # Check if any portal is active
    if gdbus introspect --session --dest org.freedesktop.portal.Desktop /org/freedesktop/portal/desktop/request/* 2>/dev/null | grep -q 'ScreenCast'; then
        is_recording=true
    fi
fi

if [ "$is_recording" = true ]; then
    echo '{"text": "🔴", "class": "recording"}'
else
    echo '{"text": "", "class": ""}'
fi