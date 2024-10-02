#!/bin/bash

current_dir=$(basename "$PWD")
if [ "$current_dir" != "dotfiles" ]; then
    echo "You must be in the dotfiles directory to run this script"
    exit 1
fi
rm -r ./.config
cp -r ~/.config/alacritty .
cp -r ~/.config/i3 .
cp -r ~/.config/nvim .
