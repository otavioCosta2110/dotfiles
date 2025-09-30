#!/bin/bash

# Check if we're running under Sway/Wayland
if [[ $XDG_SESSION_TYPE == "wayland" ]] || [[ -n $SWAYSOCK ]]; then
  # Sway/Wayland version
  current_layout=$(swaymsg -t get_inputs | jq -r '.[] | select(.type == "keyboard") | .xkb_active_layout_name' | head -1)

  echo "Current layout (Wayland): $current_layout"

  if [[ $current_layout == "English (US)" ]] || [[ $current_layout == "us" ]]; then
    swaymsg input type:keyboard xkb_layout br
    echo "Switched to Brazilian layout"
  else
    swaymsg input type:keyboard xkb_layout us
    echo "Switched to US layout"
  fi
else
  # X11 version
  layout=$(setxkbmap -query | awk '/layout/ {print $2}')

  echo "Current layout (X11): $layout"

  if [[ $layout == "us" ]]; then
    setxkbmap -layout br
    echo "Switched to Brazilian layout"
  else
    setxkbmap -layout us
    echo "Switched to US layout"
  fi
fi
