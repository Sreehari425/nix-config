{ pkgs, flakeTarget, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # for the overlay for lix go to nixos/overlay/lix/default.nix
  nix.package = pkgs.lixPackageSets.latest.lix;

  environment.systemPackages = [
    (pkgs.writeShellApplication {
      name = "nos";

      runtimeInputs = [ pkgs.nixos-rebuild ];

      text = ''
        sudo nixos-rebuild switch --flake .#"${flakeTarget}" "$@"
      '';
    })
  ];

}
