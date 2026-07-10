{ ... }:
{
  networking.networkmanager.enable = true;

  environment.etc = {
    "NetworkManager/conf.d/00-mac-random.conf".text = ''
      [device]
      wifi.scan-rand-mac-address=yes
      [connection]
      wifi.cloned-mac-address=stable
      ethernet.cloned-mac-address=stable
    '';

    "NetworkManager/conf.d/00-no-hostname.conf".text = ''
      [connection]
      hostname-mode=none
    '';

    "NetworkManager/conf.d/dns.conf".text = ''
      [main]
      dns=none
      systemd-resolved=false
    '';
  };
}
