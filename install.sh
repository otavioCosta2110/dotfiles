#!/usr/bin/env bash

case "$1" in
    "i3")
        echo "Installing i3 packages..."
        ;;
    "hyprland")
        echo "Installing Hyprland packages..."
        ;;
    "sway")
        echo "Installing Sway packages..."
        ;;
    *)
        echo "Usage: $0 [i3|hyprland|sway]"
	return 1
        ;;
esac

bash ./push.sh
bash ./install.sh $1
