{
  imports = [
    ./battery.nix
    ../../nixos/modules/fonts.nix
    ../../nixos/modules/graphical
    ../../nixos/modules/services/sddm.nix
    ../../nixos/modules/desktops/hyprland.nix
    ../../nixos/modules/services/bluetooth.nix
    ../../nixos/modules/services/audio.nix
    ../../nixos/modules/services/printing.nix
    ../../nixos/modules/dns
    ../../nixos/modules/vpn/tailscale.nix
    ./secureboot.nix
    ./kernel.nix
    ../../nixos/modules/services/keyring.nix
    ./fingerprint.nix
  ];

  networking.hostName = "tp-orion";
}
