{ ... }:
{
  services.avahi = {
    enable = true;
    ipv4 = true;
    ipv6 = true;
    nssmdns4 = true; # mDNS resolution for .local domains
    publish = {
      enable = true;
      hinfo = false;
      workstation = false;
    };
    extraConfig = ''
      [server]
      ratelimit-interval-usec=1000000
      ratelimit-burst=1000
    '';
  };
}
