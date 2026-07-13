{ isNixOS, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ff = "fastfetch";
      nf = "neofetch";
      vmm = "virt-manager";
      zj = "zellij";
      jlog = "journalctl -xe";
      jboot = "journalctl -b";
      jf = "journalctl -f";
      jerr = "journalctl -p 3 -xb";

      hms =
        if isNixOS then
          "home-manager switch --flake ~/nix-config#sreehari-nixos"
        else
          "home-manager switch --flake ~/nix-config#sreehari-standalone";
    };
  };

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ../configs/oh-my-posh/1_shell.omp.json);
  };
}
