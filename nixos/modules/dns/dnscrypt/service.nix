{
  services.dnscrypt-proxy = {
    enable = true;
    settings = import ./settings.nix;
  };
}
