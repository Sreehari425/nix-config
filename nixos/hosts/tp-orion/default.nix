{
  imports = [
    ./battery.nix
    ../../modules/fonts.nix
    ../../modules/graphical
    ../../modules/services/display-manager.nix
    ../../modules/desktops/hyprland.nix
    ../../modules/services/bluetooth.nix
    ../../modules/services/audio.nix
    ../../modules/services/printing.nix
    ../../modules/dns
    ../../modules/vpn/tailscale.nix
  ];

  networking.hostName = "tp-orion";
}
