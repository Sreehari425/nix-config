{ lib, ... }:
{
  networking.networkmanager = {
    enable = true;
    dns = "none";

    settings = {
      device = {
        "wifi.scan-rand-mac-address" = "yes";
      };
      connection = {
        "wifi.cloned-mac-address" = "stable";
        "ethernet.cloned-mac-address" = "stable";
        "hostname-mode" = "none";
      };
    };
  };

  services.resolved.enable = lib.mkForce false;
}
