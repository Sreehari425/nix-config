{ ... }:

{
  imports = [
    # ./hardware-configuration.nix

    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/users.nix
    ./modules/audio.nix
    ./modules/desktop.nix
  ];
}
