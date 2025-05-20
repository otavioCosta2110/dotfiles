#!/bin/bash

set -euo pipefail  # Enable strict mode

DOTFILES_DIR="${HOME}/dotfiles"

DOTFILES=(
    .zshrc 
    .gitconfig 
    .gitignore_global
    .tmux.conf
    .config/nvim
    .config/alacritty
    .config/i3
    .config/i3status-rust
    .config/hypr
    .config/waybar
    .local/scripts
)

main() {
    # Create dotfiles directory if it doesn't exist
    mkdir -p "${DOTFILES_DIR}"

    for file in "${DOTFILES[@]}"; do
        source_file="${HOME}/${file}"
        target_file="${DOTFILES_DIR}/${file}"
        target_dir="${DOTFILES_DIR}/$(dirname "${file}")"
        
        # Skip if source doesn't exist
        if [ ! -e "${source_file}" ]; then
            echo "Warning: Source does not exist: ${source_file}"
            continue
        fi

        # Create target directory if needed
        if [ "$(dirname "${file}")" != "." ]; then
            echo "Creating target directory: ${target_dir}"
            mkdir -p "${target_dir}"
        fi
        
        echo "Copying ${source_file} to ${target_file}"
        
        # Use rsync if available for better copying, fallback to cp
        if command -v rsync >/dev/null 2>&1; then
            rsync -a --delete "${source_file}/" "${target_file}" 2>/dev/null || \
            rsync -a "${source_file}" "${target_file}"
        else
            if [ -d "${source_file}" ]; then
                cp -a "${source_file}/." "${target_file}"
            else
                cp -a "${source_file}" "${target_file}"
            fi
        fi
    done

    echo "Dotfiles gathered successfully to ${DOTFILES_DIR}"
}

main "$@"
