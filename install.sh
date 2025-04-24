#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

DOTFILES=(
    .zshrc 
    .gitconfig .gitignore_global
    .tmux.conf
    .config/nvim
    .config/alacritty
    .config/i3
)

echo "Setting up dotfiles with stow in $DOTFILES_DIR"

for file in "${DOTFILES[@]}"; do
    src="$HOME/$file"
    dest_parent="$DOTFILES_DIR/$(dirname "$file")"
    dest="$dest_parent/$(basename "$file")"
    
    if [ -e "$src" ] && [ ! -L "$src" ]; then
        echo "Processing $file..."
        
        mkdir -p "$dest_parent"
        
        echo "  Moving to $dest"
    fi
done

echo "Creating symlinks with stow..."
cd "$DOTFILES_DIR" || exit
for dir in *; do
    if [ -d "$dir" ]; then
        echo "Stowing $dir..."
        stow --verbose=2 --target="$HOME" --restow "$dir"
    fi
done
