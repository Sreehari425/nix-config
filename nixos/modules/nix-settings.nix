{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # for the overlay for lix go to nixos/overlay/lix/default.nix
  nix.package = pkgs.lixPackageSets.latest.lix;

}
