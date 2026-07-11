{ pkgs, ... }:

let
  update-dns-blocklist = pkgs.writeShellScript "update-dns-blocklist.sh" (
    builtins.readFile ./scripts/update-blocklist.sh
  );
in
{
  systemd.services.dns-blocklist-update = {
    description = "Update HaGeZi DNS Blocklist";

    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${update-dns-blocklist}";
      User = "root";
      StandardOutput = "journal";
      StandardError = "journal";
    };
  };

  systemd.timers.dns-blocklist-update = {
    description = "Run DNS Blocklist Update 8 hours after last run";

    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnBootSec = "5min";
      OnUnitActiveSec = "8h";
      Persistent = true;
    };
  };

  systemd.tmpfiles.rules = [
    "d /var/log/dnscrypt-proxy 0755 root root -"
    "d /var/lib/dnscrypt-proxy 0755 root root -"
  ];
}
