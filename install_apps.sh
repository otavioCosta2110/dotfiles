#!/bin/bash

if ! command -v yay &> /dev/null; then
    sudo pacman -S git base-devel --noconfirm
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

yay -Syyuu --noconfirm

common_packages=(
    alacritty
    brave-browser
    brightnessctl
    discord
    flameshot
    flatpak
    fzf
    gnome-keyring
    neovim
    networkmanager
    prismlauncher
    qbittorrent
    qimgv
    rofi
    steam
    thunar
    thunar-volman
    tmux
    vim
    vlc
    wine
    zathura
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    zoxide
    zip
    unzip
    xfce4-settings
)

# i3-specific packages
i3_packages=(
    arandr
    autotiling
    i3-wm
    i3status
    i3lock
    xclip
)

hyprland_packages=(
    waybar
    hypridle
    hyprlock
    slurp
    grim
    wl-clipboard
    xdg-desktop-portal-hyprland
)

case "$1" in
    "i3")
        echo "Installing i3 packages..."
        packages=("${common_packages[@]}" "${i3_packages[@]}")
        ;;
    "hyprland")
        echo "Installing Hyprland packages..."
        packages=("${common_packages[@]}" "${hyprland_packages[@]}")
        ;;
    *)
        echo "Usage: $0 [i3|hyprland]"
        exit 1
        ;;
esac

for pkg in "${packages[@]}"; do
    yay -S --noconfirm "$pkg" || echo "Failed to install $pkg"
done

if [ "$1" == "i3" ]; then
    echo "i3 specific configuration..."
elif [ "$1" == "hyprland" ]; then
    echo "Hyprland specific configuration..."
fi

echo "Installation complete for $1!"
