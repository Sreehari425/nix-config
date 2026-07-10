{ ... }:
{
  imports = [
    ./networking.nix
    ./networkmanager.nix
    ./dnscrypt-proxy.nix
    ./firewall.nix
    ./tailscale.nix
    ./avahi.nix
  ];
}
