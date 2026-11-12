{ isNixOS, nixName, ... }:

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
      ls = "eza --icons --group-directories-first";
      l = "eza --icons --group-directories-first";
      ll = "eza -la --icons --git --group-directories-first";
      la = "eza -a --icons --group-directories-first";
      lt = "eza --tree --icons --level=4";
      lh = "eza -lh --icons --group-directories-first";
      lla = "eza -la --icons";
      hms =
        "home-manager switch --flake ~/nix-config#sreehari-${if isNixOS then "nixos" else "standalone"}-${nixName}";
    };
    initExtra = ''
      export PATH="/home/sreehari/.local/share/../bin:$PATH"
    '';
  };
  programs.eza = {
    enable = true;
  };
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ../configs/oh-my-posh/1_shell.omp.json);
  };
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
}
