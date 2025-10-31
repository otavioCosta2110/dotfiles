#!/bin/bash

STATUS_FILE="/tmp/wlsleephandler_manual_inhibit"

if [ "$1" = "toggle" ]; then
    PID=$(pgrep -f sleepwatcher-rs)
    if [ -n "$PID" ]; then
        kill -USR1 $PID
        # Send signal to Waybar to update
        WAYBAR_PID=$(pgrep -f waybar)
        if [ -n "$WAYBAR_PID" ]; then
            kill -s RTMIN+1 $WAYBAR_PID
        fi
    fi
else
    if [ -f "$STATUS_FILE" ]; then
        echo '󰛊 '
    else
        echo '󰾫 '
    fi
fi
