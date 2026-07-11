{ pkgs, ... }:

{
  services.printing = {
    enable = true;

    drivers = [ pkgs.hplipWithPlugin ];
  };
  environment.systemPackages = [ pkgs.hplipWithPlugin ];
  # 2. Network auto-discovery framework
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # 3. Scanner support
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };
}
