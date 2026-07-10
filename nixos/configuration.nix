{ ... }:

{
  imports = [
    # ./hardware-configuration.nix

    ./modules/boot.nix
    ./modules/networking
    ./modules/users.nix
    ./modules/audio.nix
    ./modules/desktop.nix
  ];

  system.stateVersion = "26.05";

}
