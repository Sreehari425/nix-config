{
  description = "Sreehari's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add the nixGL flake input here
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixgl,
      ...
    }: # Destructure nixgl here
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      homeConfigurations.sreehari = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Pass nixgl down into your modules so modules/kitty.nix can read it
        extraSpecialArgs = { inherit nixgl; };

        modules = [
          ./home/home.nix
        ];
      };
    };
}
