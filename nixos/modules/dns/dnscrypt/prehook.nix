{ pkgs, ... }:

{
  systemd.services.dnscrypt-proxy = {
    preStart = ''
        mkdir -p /var/lib/dnscrypt-proxy

        if [ ! -f /var/lib/dnscrypt-proxy/hagezi.txt ]; then
          echo "hagezi.txt missing! Downloading default blocklist..."
          
          ${pkgs.curl}/bin/curl -sSL -o /var/lib/dnscrypt-proxy/hagezi.txt \
      https://codeberg.org/hagezi/mirror2/raw/branch/main/dns-blocklists/wildcard/pro.plus-onlydomains.txt        
          # Ensure permissions allow the isolated service user to read it
          chmod 644 /var/lib/dnscrypt-proxy/hagezi.txt
        fi
    '';
  };
}
