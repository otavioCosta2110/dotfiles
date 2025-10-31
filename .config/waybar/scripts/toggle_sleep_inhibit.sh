#!/bin/bash

PID=$(pgrep -f sleepwatcher-rs)
echo "PID: $PID"

if [ -n "$PID" ]; then
    echo "Before toggle: $([ -f /tmp/wlsleephandler_manual_inhibit ] && echo 'active' || echo 'inactive')"
    kill -USR1 $PID
    sleep 0.1
    echo "After toggle: $([ -f /tmp/wlsleephandler_manual_inhibit ] && echo 'active' || echo 'inactive')"
    if [ -f "/tmp/wlsleephandler_manual_inhibit" ]; then
        echo "Sleep inhibition activated"
    else
        echo "Sleep inhibition deactivated"
    fi
else
    echo "sleepwatcher-rs not running"
fi

