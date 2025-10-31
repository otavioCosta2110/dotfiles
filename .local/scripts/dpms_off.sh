#!/bin/bash

handle_sway() {
    echo "Detected Sway - enabling DPMS for all outputs"
    swaymsg -r -t get_outputs | jq -r '.[].name' | while read -r output; do
        echo "Enabling DPMS for output: $output"
        swaymsg output "$output" dpms off
    done
}

handle_hyprland() {
    echo "Detected Hyprland - enabling monitors"
    hyprctl dispatch dpms off
}

if [ -n "$SWAYSOCK" ] || pgrep -x sway >/dev/null 2>&1; then
    handle_sway
elif [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ] || pgrep -x Hyprland >/dev/null 2>&1; then
    handle_hyprland
else
    echo "Error: Neither Sway nor Hyprland detected as running"
    echo "SWAYSOCK: $SWAYSOCK"
    echo "HYPRLAND_INSTANCE_SIGNATURE: $HYPRLAND_INSTANCE_SIGNATURE"
    exit 1
fi
