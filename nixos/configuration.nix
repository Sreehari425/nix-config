{ ... }:

{
  imports = [
    ./modules/boot
    ./modules/networking
    ./modules/users.nix
    ./modules/nix-settings.nix
    ./modules/system.nix
  ];
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  boot.loader.grub.device = "/dev/sda";

}
