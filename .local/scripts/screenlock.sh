#!/bin/bash

xss-lock -- i3lock -c 000000 &

xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 600 \
    'i3lock -c "#000000" && xset dpms force off' \
    '' \
  --timer 3600 \
    'systemctl suspend' \
    ''
