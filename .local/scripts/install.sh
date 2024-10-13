#!/bin/bash

sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

yay -S zip unzip rar unrar alacritty tmux neovim vivaldi httpie zsh zsh-completions zsh-syntax-highlighting zsh-theme-powerlevel10k zsh-autosuggestions tmux fzf ripgrep --noconfirm

git clone https://github.com/otaviocosta2110/dotfiles

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

cd dotfiles
sudo chmod +x fromGitToPc.sh
./fromGitToPc.sh 

