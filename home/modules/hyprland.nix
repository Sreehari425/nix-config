{ pkgs, ... }:
{
  # Packages
  home.packages = with pkgs; [
    libnotify
    waybar
    awww
  ];

  # Cursor configuration
  services.hypridle.enable = true;
}
