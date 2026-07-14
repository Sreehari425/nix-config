{ pkgs, ... }:

let
  hypr-dots-black = pkgs.stdenvNoCC.mkDerivation {
    pname = "hypr-dots-black";
    version = "1.0";

    src = ../configs/cursors/hypr-dots-black;

    installPhase = ''
      mkdir -p $out/share/icons/hypr-dots-black
      cp -r . $out/share/icons/hypr-dots-black
    '';
  };
in
{
  # Packages
  home.packages = with pkgs; [
    libnotify
    waybar
    rofi
    awww
  ];

  # Cursor configuration
  home.pointerCursor = {
    enable = true;
    package = hypr-dots-black;
    name = "hypr-dots-black";
    gtk.enable = true;
    x11.enable = true;
    size = 24;
  };

  # Services
  services.hypridle.enable = true;
}
