{ pkgs, ... }:

{
  programs.bash.enable = true;

  users.users.sreehari = {
    isNormalUser = true;
    description = "Sreehari";

    extraGroups = [
      "wheel"
      "video"
      "audio"
      "input"
      "uucp"
      "scanner"
      "lp"

      # "docker"       # <-- Keep these commented out until you enable
      # "libvirt"      # <-- virtualization/docker services later, or NixOS will crash!
    ];
    shell = pkgs.bash;
  };
}
