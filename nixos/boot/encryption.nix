{ ... }:

{
  boot.initrd.luks.devices = {
    "cryptroot" = {

      #this is just place holder i hope i dont forget swaping this out lmao
      device = "/dev/disk/by-uuid/00000000-0000-0000-0000-000000000000";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
