#!/bin/bash

current_dir=$(basename "$PWD")
if [ "$current_dir" != "dotfiles" ]; then
    echo "You must be in the dotfiles directory to run this script"
    exit 1
fi

rm -r ./.config
rm -r ./.local
rm -r ./.fonts
rm ./.zshrc
rm ./.tmux.conf

mkdir .config

cp -r ~/.config/alacritty .config/alacritty
cp -r ~/.config/i3 .config/i3
cp -r ~/.config/nvim .config/nvim
mkdir -p .local/scripts
cp -r ~/.local/scripts/* ./.local/scripts
cp -r ~/.fonts ./.fonts
cp ~/.zshrc ./.zshrc
cp ~/.tmux.conf ./.tmux.conf
