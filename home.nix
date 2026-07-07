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
      hms = "home-manager switch --flake ~/nix-config#sreehari";

    };

  };
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ./configs/oh-my-posh/1_shell.omp.json);
  };
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Sreehari Anil";
        email = "sreehari7102008@gmail.com";
      };

      init.defaultBranch = "main";

      gpg.format = "ssh";
      gpg."ssh".program = "ssh-keygen";

      commit.gpgSign = true;

      filter."lfs" = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };

      sendemail = {
        smtpserver = "smtp.gmail.com";
        smtpuser = "sreehari7102008@gmail.com";
        smtpencryption = "tls";
        smtpserverport = 587;
      };
    };

    signing = {
      key = "/home/sreehari/.ssh/id_rsa.pub";
      signByDefault = true;
    };
  };

}
