{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.layout = "br";
  services.xserver.xkbOptions = "grp:alt_space_toggle";

  programs.hyprland.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.otavio = {
    isNormalUser = true;
    description = "otavio";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    alacritty
    waybar
    swww
    cliphist
    wl-clipboard
    swayosd
    gammastep
    mako
    python3Packages.autotiling
    fuzzel
    hyprshot
    playerctl
    jq
    polkit_gnome
    thunar
    pavucontrol
    spotify
    discord
    firefox
    xfce.xfce4-settings
    btop
    tmux
    neovim
    suckless-tools  # for dmenu_run
  ];

  services.gnome.gnome-keyring.enable = true;

  home-manager.users.otavio = { imports = [ ./home.nix ]; };

  system.stateVersion = "24.05";
}
