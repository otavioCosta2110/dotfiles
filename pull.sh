#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

DOTFILES=(
    .zshrc 
    .gitconfig .gitignore_global
    .tmux.conf
    .config/nvim
    .config/alacritty
    .config/i3
    .config/i3status-rs
    .config/hypr
    .config/waybar
)

for file in "${DOTFILES[@]}"; do
    source_file="$HOME/$file"
    target_file="$DOTFILES_DIR/$file"
    target_dir="$DOTFILES_DIR/$(dirname "$file")"
    
    # Create target directory if it doesn't exist
    if [ ! -d "$target_dir" ] && [ "$(dirname "$file")" != "." ]; then
        echo "Creating target directory: $target_dir"
        mkdir -p "$target_dir"
    fi
    
    # Check if source exists
    if [ -e "$source_file" ]; then
        echo "Copying $source_file to $target_file"
        cp -r "$source_file" "$target_file"
    else
        echo "Warning: Source file does not exist: $source_file"
    fi
done

echo "Dotfiles gathered successfully."
