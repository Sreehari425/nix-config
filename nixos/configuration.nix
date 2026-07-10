{ ... }:

{
  imports = [
    # ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking
    ./modules/users.nix
    ./modules/audio.nix
    ./modules/desktop.nix
    ./modules/nix-settings.nix
    ./modules/system.nix
  ];
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  boot.loader.grub.device = "/dev/sda";
  #this is just a place holder to make nix happy for now

}
