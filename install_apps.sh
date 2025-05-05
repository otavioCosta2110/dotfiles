#!/bin/bash

if [ "$1" == "everything" ]; then
  sudo pacman -S git  base-devel --noconfirm
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  yay -Syyuu --noconfirm

  packages=(
    cowsay
    alacritty
    neovim
    vim
    arandr
    brave-browser
    brightnessctl
    discord
    flameshot
    flatpak
    gnome-keyring
    xfce4-settings
    steam
    neofetch
    networkmanager
    wine
    xclip
    docker
    autotiling
    alsa-utils
    blueman
    bluez
    go
    radeon-profile-git
    fzf
    prismlauncher
    rofi
    vulkan-amdgpu-pro
    vulkan-radeon
    vulkan-tools
    zathura
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    zip
    zoxide
    vlc
    unzip
    tmux
    thunar
    thunar-voman
    qimgv
    qbittorrent
  )

  for pkg in "${packages[@]}"; do
    yay -S --noconfirm "$pkg"
  done
fi
