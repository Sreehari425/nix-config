{ pkgs, ... }:
{
  networking.nftables.enable = true;

  services.firewalld = {
    enable = true;
    package = pkgs.firewalld;
  };

  # Public zone - mirrors your Arch setup
  environment.etc."firewalld/zones/public.xml".text = ''
    <?xml version="1.0" encoding="utf-8"?>
    <zone>
      <short>Public</short>
      <description>For use in public areas.</description>
      <service name="dhcpv6-client"/>
      <service name="kdeconnect"/>
      <service name="mdns"/>
      <port protocol="tcp" port="53317"/>
      <port protocol="udp" port="53317"/>
      <port protocol="udp" port="7884"/>
      <port protocol="tcp" port="7889"/>
      <forward/>
    </zone>
  '';
}
