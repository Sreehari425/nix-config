{ pkgs, ... }:

{
  services.hypridle.enable = true;

  # programs.hyprlock.enable = true;
  # Inside your home.nix
  home.packages = with pkgs; [
    libnotify # Provides the 'notify-send' command
    waybar
    rofi
    awww
  ];

  # Automatically installs, configures, and starts SwayNC
  services.swaync.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "hypr-dots-black";
    size = 24;
  };
}
