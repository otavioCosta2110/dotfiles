#!/bin/sh

# Start swayidle in background
swayidle -w \
  timeout 1 'swaylock -f -c 000000' \
  timeout 2 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' &

SWAYIDLE_PID=$!

# Give it time to lock + DPMS off
sleep 6

# Kill only this swayidle instance
kill "$SWAYIDLE_PID" 2>/dev/null

