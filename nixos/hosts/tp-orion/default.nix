{
  imports = [
    ./battery.nix
    ../../modules/fonts.nix
    ../../modules/graphical
    ../../modules/desktops/hyprland.nix
    ../../modules/bluetooth.nix
    ../../modules/audio.nix
    ../../modules/printing.nix
    ../../modules/dns
    ../../modules/vpn/tailscale.nix
  ];

  networking.hostName = "tp-orion";
}
