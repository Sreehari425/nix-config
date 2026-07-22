{
  imports = [
    ../../modules/services/openssh.nix
    ../../modules/fonts.nix
    ../../modules/graphical
    ../../modules/services/plasma-login-manager.nix
    ../../modules/services/bluetooth.nix
    ../../modules/services/audio.nix
    ../../modules/services/printing.nix
    ../../modules/services/gaming.nix
    ../../modules/dns
    ../../modules/vpn/tailscale.nix
    ./kernel.nix
    ../../modules/desktops/kde-applications.nix
    ./baloo.nix
    ./bootloader.nix
    ./../../modules/desktops/plasma.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "pc-phoenix";
}
