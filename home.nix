{ config, pkgs, ... }:

let
  dotfiles = builtins.fetchGit {
    url = "https://github.com/otaviocosta2110/dotfiles.git";
    rev = "main";
  };
in
{
  home.username = "otavio";
  home.homeDirectory = "/home/otavio";

  home.packages = with pkgs; [
    # Additional user packages if needed
  ];

  # Symlink the Hyprland config files
  home.file.".config/hypr/hyprland.conf".source = "${dotfiles}/.config/hypr/hyprland.conf";
  home.file.".config/hypr/exec.conf".source = "${dotfiles}/.config/hypr/exec.conf";
  home.file.".config/hypr/input.conf".source = "${dotfiles}/.config/hypr/input.conf";
  home.file.".config/hypr/keybinds.conf".source = "${dotfiles}/.config/hypr/keybinds.conf";
  home.file.".config/hypr/monitors.conf".source = "${dotfiles}/.config/hypr/monitors.conf";
  home.file.".config/hypr/rules.conf".source = "${dotfiles}/.config/hypr/rules.conf";
  home.file.".config/hypr/workspaces.conf".source = "${dotfiles}/.config/hypr/workspaces.conf";
  home.file.".config/hypr/hypridle.conf".source = "${dotfiles}/.config/hypr/hypridle.conf";
  home.file.".config/hypr/hyprlock.conf".source = "${dotfiles}/.config/hypr/hyprlock.conf";

  # Symlink other configs
  home.file.".config/alacritty/alacritty.toml".source = "${dotfiles}/.config/alacritty/alacritty.toml";
  home.file.".config/fuzzel/fuzzel.ini".source = "${dotfiles}/.config/fuzzel/fuzzel.ini";
  home.file.".config/mako/config".source = "${dotfiles}/.config/mako/config";
  home.file.".config/waybar/config.jsonc".source = "${dotfiles}/.config/waybar/config.jsonc";
  home.file.".config/waybar/style.css".source = "${dotfiles}/.config/waybar/style.css";
  home.file.".config/swayosd/style.css".source = "${dotfiles}/.config/swayosd/style.css";
  home.file.".config/starship.toml".source = "${dotfiles}/starship.toml";
  home.file.".config/fish/config.fish".source = "${dotfiles}/.config/fish/config.fish";
  home.file.".tmux.conf".source = "${dotfiles}/.tmux.conf";
  home.file.".gitconfig".source = "${dotfiles}/.gitconfig";

  # Scripts
  home.file.".local/scripts/brightness.sh".source = "${dotfiles}/.local/scripts/brightness.sh";
  home.file.".local/scripts/changelayout.sh".source = "${dotfiles}/.local/scripts/changelayout.sh";
  home.file.".local/scripts/favs".source = "${dotfiles}/.local/scripts/favs";
  home.file.".local/scripts/fuzzel_fzf.sh".source = "${dotfiles}/.local/scripts/fuzzel_fzf.sh";
  home.file.".local/scripts/idle-inhibitor".source = "${dotfiles}/.local/scripts/idle-inhibitor";
  home.file.".local/scripts/menu".source = "${dotfiles}/.local/scripts/menu";
  home.file.".local/scripts/nitrogen.sh".source = "${dotfiles}/.local/scripts/nitrogen.sh";
  home.file.".local/scripts/opencalendar.sh".source = "${dotfiles}/.local/scripts/opencalendar.sh";
  home.file.".local/scripts/powerprofiles".source = "${dotfiles}/.local/scripts/powerprofiles";
  home.file.".local/scripts/screen_layout.sh".source = "${dotfiles}/.local/scripts/screen_layout.sh";
  home.file.".local/scripts/screenlock.sh".source = "${dotfiles}/.local/scripts/screenlock.sh";
  home.file.".local/scripts/screenshot.sh".source = "${dotfiles}/.local/scripts/screenshot.sh";
  home.file.".local/scripts/sessionizer".source = "${dotfiles}/.local/scripts/sessionizer";
  home.file.".local/scripts/silent_10s.wav".source = "${dotfiles}/.local/scripts/silent_10s.wav";
  home.file.".local/scripts/sleep_inhibit.sh".source = "${dotfiles}/.local/scripts/sleep_inhibit.sh";
  home.file.".local/scripts/toggle_sleep_inhibit.sh".source = "${dotfiles}/.local/scripts/toggle_sleep_inhibit.sh";
  home.file.".local/scripts/tmux-new-kill.fish".source = "${dotfiles}/.local/scripts/tmux-new-kill.fish";
  home.file.".local/scripts/tmux-sessionizer.sh".source = "${dotfiles}/.local/scripts/tmux-sessionizer.sh";
  home.file.".local/scripts/tmux-windowizer.sh".source = "${dotfiles}/.local/scripts/tmux-windowizer.sh";
  home.file.".local/scripts/volume.sh".source = "${dotfiles}/.local/scripts/volume.sh";
  home.file.".local/scripts/waybar-gpu.sh".source = "${dotfiles}/.local/scripts/waybar-gpu.sh";
  home.file.".local/scripts/waybar_sleep_inhibit.sh".source = "${dotfiles}/.local/scripts/waybar_sleep_inhibit.sh";
  home.file.".local/scripts/workday.sh".source = "${dotfiles}/.local/scripts/workday.sh";

  # Neovim config
  home.file.".config/nvim/init.lua".source = "${dotfiles}/.config/nvim/init.lua";
  # And the lua files, but to keep it simple, perhaps symlink the whole directory
  # But for now, list key ones

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}