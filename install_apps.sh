#!/bin/bash

# essentials
if [ "$1" == "everything" ]; then
  git clone https://aur.archlinux.org/yay.git
  cd yay

  makepkg -si

  yay -Syyuu --noconfirm

  yay -S --noconfirm \
    cowsay \
    alacritty \
    neovim \
    vim \
    arandr \
    brave-browser \
    brightnessctl \
    discord \
    flameshot \
    flatpak \
    git \
    base-devel \
    base-devel \
    gnome-keyring \
    xfce4-settings \
    steam \
    neofetch \
    networkmanager \
    wine \
    xclip \
    docker \
    autotiling \
    alsa-utils \
    blueman \
    bluez \
    go \
    radeon-profile-git \ 
    fzf \ 
    prism-launcher \ 
    rofi \ 
    vulkan-amdgpu-pro \ 
    vulkan-radeon \ 
    vulkan-tools \ 
    zathura \ 
    zsh-autosuggestions \ 
    zsh-syntax-highlighting \
    zsh-completions \
    zip \
    zoxide \
    vlc \
    unzip \
    tmux \
    thunar \
    thunar-voman \
    qimgv \
    qbittorrent

fi

