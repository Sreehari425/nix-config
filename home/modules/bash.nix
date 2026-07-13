{ ... }: {
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
      hms = "home-manager switch --flake ~/nix-config#sreehari";
    };
  };
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ../configs/oh-my-posh/1_shell.omp.json); # Adjusted relative path
  };
}
