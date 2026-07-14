{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

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

      hms = "home-manager switch --flake ~/nix-config#sreehari-standalone";
    };

    history = {
      size = 100000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
    };

    initContent = ''
      eval "$(oh-my-posh init zsh --config ${../configs/oh-my-posh/1_shell.omp.json})"
    '';
  };

  programs.eza.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.oh-my-posh.enable = true;
}
