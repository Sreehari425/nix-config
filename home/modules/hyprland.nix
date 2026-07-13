{ pkgs, ... }:

{
  services.hypridle.enable = true;

  # programs.hyprlock.enable = true;
  # Inside your home.nix
  home.packages = with pkgs; [
    libnotify # Provides the 'notify-send' command
  ];

  # Automatically installs, configures, and starts SwayNC
  services.swaync.enable = true;

}
