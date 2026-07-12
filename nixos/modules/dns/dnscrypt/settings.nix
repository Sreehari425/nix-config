{
  listen_addresses = [
    "127.0.0.1:5300"
    "[::1]:5300"
  ];

  server_names = [
    "cloudflare"
    "cloudflare-ipv6"
    "google"
    "google-ipv6"
  ];

  max_clients = 250;

  ipv4_servers = true;
  ipv6_servers = false;

  dnscrypt_servers = true;
  doh_servers = true;
  odoh_servers = false;

  require_dnssec = false;
  require_nolog = true;
  require_nofilter = true;

  force_tcp = false;

  http3 = false;
  http3_probe = false;

  timeout = 5000;
  keepalive = 30;

  log_file = "/var/log/dnscrypt-proxy/dnscrypt-proxy.log";
  use_syslog = true;

  log_files_max_size = 10;
  log_files_max_age = 7;
  log_files_max_backups = 1;

  cert_refresh_delay = 240;

  bootstrap_resolvers = [
    "9.9.9.11:53"
    "8.8.8.8:53"
  ];

  ignore_system_dns = true;

  netprobe_timeout = 60;
  netprobe_address = "9.9.9.9:53";

  block_ipv6 = false;
  block_unqualified = true;
  block_undelegated = true;

  reject_ttl = 10;

  cache = true;
  cache_size = 4096;
  cache_min_ttl = 2400;
  cache_max_ttl = 86400;
  cache_neg_min_ttl = 60;
  cache_neg_max_ttl = 600;
  blocked_names = {
    blocked_names_file = "/var/lib/dnscrypt-proxy/hagezi.txt";
  };
  sources = {
    public-resolvers = {
      urls = [
        "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
        "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
      ];

      cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
      minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      refresh_delay = 73;
      prefix = "";
    };

    relays = {
      urls = [
        "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md"
        "https://download.dnscrypt.info/resolvers-list/v3/relays.md"
      ];

      cache_file = "/var/cache/dnscrypt-proxy/relays.md";
      minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      refresh_delay = 73;
      prefix = "";
    };
  };

  broken_implementations.fragments_blocked = [
    "cisco"
    "cisco-ipv6"
    "cisco-familyshield"
    "cisco-familyshield-ipv6"
    "cisco-sandbox"
    "cleanbrowsing-adult"
    "cleanbrowsing-adult-ipv6"
    "cleanbrowsing-family"
    "cleanbrowsing-family-ipv6"
    "cleanbrowsing-security"
    "cleanbrowsing-security-ipv6"
  ];

  captive_portals = { };

  local_doh = { };

  query_log = {
    format = "tsv";
  };

  nx_log = {
    format = "tsv";
  };

  blocked_ips = { };

  allowed_names = { };

  allowed_ips = { };

  schedules = { };

  doh_client_x509_auth = { };

  dns64 = { };

  ip_encryption = {
    algorithm = "none";
    key = "";
  };

  anonymized_dns = {
    skip_incompatible = false;
  };

  monitoring_ui = {
    enabled = false;
    listen_address = "127.0.0.1:8080";
  };
}
