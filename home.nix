{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles.nix
  ];

  home.username = "sreehari";
  home.homeDirectory = "/home/sreehari";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    helix
    fastfetch
    git
  ];

  # home.sessionVariables = {
  #   MANPAGER = "nvim +Man!";
  #   POSH_THEME = "${config.xdg.configHome}/oh-my-posh/1_shell.omp.json";
  # };

  programs.bash = {
    enable = true;

    shellAliases = {
      ff = "fastfetch";
      nf = "neofetch";
      hx = "helix";
      vmm = "virt-manager";
      zj = "zellij";

      jlog = "journalctl -xe";
      jboot = "journalctl -b";
      jf = "journalctl -f";
      jerr = "journalctl -p 3 -xb";
    };

  };
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ./configs/oh-my-posh/1_shell.omp.json);
  };
}
