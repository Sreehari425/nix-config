{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # File management
    eza
    zoxide
    yazi
    fd
    bat
    dust

    # Search
    ripgrep
    fzf

    # System
    btop
    procs
    duf

    # Utilities
    jq
    yq
    xh
    tldr
    hyperfine
    sd

    # Git
    delta

    # Nix
    nix-tree
    nix-output-monitor
    nvd

    #others
    fastfetch
  ];
}
