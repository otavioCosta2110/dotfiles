#!/bin/bash

# Detect if running under X11 or Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # HYPRLAND/WAYLAND VERSION
    echo "Running under Wayland (Hyprland)"
    
    # Get monitor info
    monitors=$(hyprctl monitors -j)
    hdmi_connected=$(echo "$monitors" | jq -r '.[] | select(.name=="HDMI-A-1") | .name')
    
    if [ -n "$hdmi_connected" ]; then
        echo "HDMI-A-1 connected - setting up dual monitors"
        hyprctl keyword monitor "HDMI-A-1,1920x1080@60,0x0,1"
        hyprctl keyword monitor "eDP-1,1920x1080@60,1920x0,1"
    else
        echo "Only eDP-1 connected - single monitor setup"
        hyprctl keyword monitor "eDP-1,1920x1080@60,0x0,1"
    fi
    
    # Reload Hyprland to apply changes
    hyprctl reload
else
    # X11/XRANDR VERSION
    export DISPLAY=:0
    export XAUTHORITY=/home/otavio/.Xauthority
    echo "Running under X11 (xrandr)"
    
    if xrandr | grep -q "HDMI-A-0 connected"; then
        echo "HDMI-A-0 connected - setting up dual monitors"
        xrandr --output eDP --primary --mode 1920x1080 --pos 1920x0 --rotate normal \
               --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal
    else
        echo "Only eDP connected - single monitor setup"
        xrandr --output eDP --mode 1920x1080 --pos 0x0 --rotate normal
    fi
    i3-msg restart
    {
      date
      echo "Monitor hotplug detected"
      xrandr --query
    } >> /tmp/monitor-hotplug.log 2>&1
fi
