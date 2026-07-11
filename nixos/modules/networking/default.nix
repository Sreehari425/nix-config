{ ... }:
{
  imports = [
    ./networking.nix
    ./networkmanager.nix
    ./dnscrypt
    ./firewall.nix
    ./tailscale.nix
    ./avahi.nix
  ];
}
