#!/bin/sh
output=$(xrandr | grep -q "HDMI-A-0 connected") 
if [ $? -eq 0 ]; then
  # xrandr --output eDP --off --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal
  xrandr --output eDP --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal

else
  xrandr --output eDP --mode 1920x1080 --pos 0x0 --rotate normal
fi

