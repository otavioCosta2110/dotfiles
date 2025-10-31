#!/bin/bash

STATUS_FILE="/tmp/wlsleephandler_manual_inhibit"

if [ -f "$STATUS_FILE" ]; then
    echo '{"text": "Inhibited", "class": "active"}'
else
    echo '{"text": "Not Inhibited", "class": "inactive"}'
fi