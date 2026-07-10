{ ... }:
{
  networking = {
    hostName = "thinkpad";
    useDHCP = true;
  };

  services.resolved = {
    enable = true;
    extraConfig = ''
      DNS=127.0.0.1:5300
      Domains=~.
      DNSSEC=no
      DNSOverTLS=no
      DNSStubListener=yes
      FallbackDNS=
      LLMNR=no
      MulticastDNS=no
      DNSStubListenerExtra=127.0.0.1:53
    '';
  };
}
