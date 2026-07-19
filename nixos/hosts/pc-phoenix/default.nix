{
  imports = [
    ../../modules/fonts.nix
    ../../modules/graphical
    ../../modules/services/plasma-login-manager.nix
    ../../modules/services/bluetooth.nix
    ../../modules/services/audio.nix
    ../../modules/services/printing.nix
    ../../modules/dns
    ../../modules/vpn/tailscale.nix
    ./kernel.nix
    ../../modules/desktops/kde-applications.nix
    ./baloo.nix
  ];

  networking.hostName = "pc-phoenix";
}
