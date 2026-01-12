#!/bin/bash

if ! command -v yay &> /dev/null; then
    sudo pacman -S git base-devel --noconfirm
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

yay -Syu --noconfirm

common_packages=(
    alacritty
    ripgrep
    brave-browser
    # firefox
    brightnessctl
    playerctl
    discord
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
    tumbler
    tmux
    vim
    vlc
    wine
    zathura
    # zsh-autosuggestions
    # zsh-completions
    # zsh-syntax-highlighting
    fish
    zoxide
    zip
    unzip
    xfce4-settings
    spotify
    jq
    btop
    pavucontrol
    mako
    polkit-gnome
    libnotify
    exo
    cargo
    python3
    fuzzel
    exa
    starship
    ttf-cascadia-code-nerd
    nwg-look
    radeon-profile-daemon
    fish
    starship
    tmux
)

# i3-specific packages
i3_packages=(
    arandr
    autotiling
    i3-wm
    i3status
    i3lock
    xclip
    flameshot
)

hyprland_packages=(
    waybar
    # hypridle
    hyprlock
    gammastep
    hyprshot
    # slurp
    # grim
    wl-clipboard
    xdg-desktop-portal-hyprland
    swww
    swayosd
    cliphist
    dmenu
)

sway_packages=(
    autotiling
    gammastep
    hyprshot
    waybar
    wl-clipboard
    swayosd
    cliphist
    dmenu
    xdg-desktop-portal-wlr
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
    "sway")
        echo "Installing Sway packages..."
        packages=("${common_packages[@]}" "${sway_packages[@]}")
        ;;
    *)
        echo "Usage: $0 [i3|hyprland]"
        packages=("${common_packages[@]}")
        ;;
esac

for pkg in "${packages[@]}"; do
    yay -S --noconfirm --needed "$pkg" || echo "Failed to install $pkg"
done

if [ "$1" == "i3" ]; then
    echo "i3 specific configuration..."
elif [ "$1" == "hyprland" ]; then
    echo "Hyprland specific configuration..."
fi

cargo install --git https://github.com/otavioCosta2110/wlsleephandler-rs-audio-inhibit

echo "Installation complete for $1!"
