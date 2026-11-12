{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Command-line coding agents
    claude-code
    codex
    cursor-cli
    antigravity-cli
    devin-cli

    # Desktop apps / IDEs
    code-cursor
    antigravity-ide
    devin-desktop
  ];
}
