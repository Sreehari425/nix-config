{ ... }:

{
  imports = [
    # ./hardware-configuration.nix
    ./modules/boot
    ./modules/networking
    ./modules/users.nix
    ./modules/audio.nix
    ./modules/nix-settings.nix
    ./modules/system.nix
    ./modules/bluetooth.nix
    ./modules/fonts.nix
    ./modules/graphical
    ./modules/desktops
  ];
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  boot.loader.grub.device = "/dev/sda";
  #this is just a place holder to make nix happy for now

}
