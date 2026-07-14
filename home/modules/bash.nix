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
      ls = "eza --icons --group-directories-first";
      l = "eza --icons --group-directories-first";
      ll = "eza -la --icons --git --group-directories-first";
      la = "eza -a --icons --group-directories-first";
      lt = "eza --tree --icons --level=2";
      lh = "eza -lh --icons --group-directories-first";
      lla = "eza -la --icons";
      hms =
        if isNixOS then
          "home-manager switch --flake ~/nix-config#sreehari-nixos"
        else
          "home-manager switch --flake ~/nix-config#sreehari-standalone";
    };
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
