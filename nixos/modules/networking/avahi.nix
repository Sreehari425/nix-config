{ ... }:
{
  services.avahi = {
    enable = true;
    nssmdns4 = true; # mDNS resolution for .local domains
    settings = {
      server = {
        use-ipv4 = true;
        use-ipv6 = true;
      };
      publish = {
        "disable-publishing" = false;
        "publish-hinfo" = false;
        "publish-workstation" = false;
      };
    };
    extraConfig = ''
      [server]
      ratelimit-interval-usec=1000000
      ratelimit-burst=1000
    '';
  };
}
