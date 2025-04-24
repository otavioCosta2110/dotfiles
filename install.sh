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

for file in "${DOTFILES[@]}"; do
    target_dir="$HOME/$(dirname "$file")"
    if [ ! -d "$target_dir" ] && [ "$(dirname "$file")" != "." ]; then
        echo "Creating target directory: $target_dir"
        mkdir -p "$target_dir"
    fi
    cp -r "$DOTFILES_DIR/$file" "$target_dir"
done

echo "Creating symlinks with stow..."
cd "$DOTFILES_DIR" || exit

for dir in *; do
    if [ -d "$dir" ]; then
        echo "Stowing $dir..."
        stow --verbose=2 --target="$HOME" --restow "$dir"
    fi
done
