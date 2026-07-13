{ ... }:

{
  imports = [
    # ./hardware-configuration.nix
    ./modules/boot
    ./modules/networking
    ./modules/users.nix
    ./modules/nix-settings.nix
    ./modules/system.nix
    ./modules/services/openssh.nix
  ];
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  boot.loader.grub.device = "/dev/sda";
  #this is just a place holder to make nix happy for now

}
