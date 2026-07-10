{ pkgs, ... }:
{
  networking.nftables.enable = true;

  services.firewalld = {
    enable = true;
    package = pkgs.firewalld;

    zones.public = {
      short = "Public";
      description = "For use in public areas.";

      services = [
        "dhcpv6-client"
        "kdeconnect"
        "mdns"
      ];

      ports = [
        {
          port = 53317;
          protocol = "tcp";
        }
        {
          port = 53317;
          protocol = "udp";
        }
        {
          port = 7884;
          protocol = "udp";
        }
        {
          port = 7889;
          protocol = "tcp";
        }
      ];

      forward = true;
    };
  };
}
