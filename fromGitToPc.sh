#!/bin/bash

current_dir=$(basename "$PWD")
if [ "$current_dir" != "dotfiles" ]; then
    echo "You must be in the dotfiles directory to run this script"
    exit 1
fi

rm -r ~/.config/alacritty
rm -r ~/.config/i3
rm -r ~/.config/nvim

cp -r ./.config/alacritty ~/.config/alacritty
cp -r ./.config/i3 ~/.config/i3
cp -r ./.config/nvim ~/.config/nvim