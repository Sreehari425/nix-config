{
  imports = [
    ../../nixos/modules/services/openssh.nix
    ../../nixos/modules/fonts.nix
    ../../nixos/modules/graphical
    ../../nixos/modules/services/plasma-login-manager.nix
    ../../nixos/modules/services/bluetooth.nix
    ../../nixos/modules/services/audio.nix
    ../../nixos/modules/services/printing.nix
    ../../nixos/modules/services/gaming.nix
    ../../nixos/modules/dns
    ../../nixos/modules/vpn/tailscale.nix
    ./kernel.nix
    ../../nixos/modules/desktops/kde-applications.nix
    ./baloo.nix
    ./bootloader.nix
    ./../../nixos/modules/desktops/plasma.nix
    ./hardware-configuration.nix
    ../../nixos/modules/heroic.nix
  ];

  networking.hostName = "pc-phoenix";
}
