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
    catppuccin.url = "github:catppuccin/nix";
    quantum-launcher.url = "github:Sreehari425/quantumlauncher/nix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixgl,
      catppuccin,
      quantum-launcher,
      ...
    }: # Destructure nixgl here
    let
      system = "x86_64-linux";
      nixpkgsOverlays = import ./overlays;
      pkgs = import nixpkgs {
        inherit system;
        overlays = nixpkgsOverlays;
      };
    in
    {
      homeConfigurations.sreehari = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Pass nixgl down into your modules so modules/kitty.nix can read it
        extraSpecialArgs = {
          inherit nixgl;
          quantumLauncher = quantum-launcher;
        };

        modules = [
          catppuccin.homeModules.catppuccin # for rofi powermenu.sh
          ./home/home.nix
        ];
      };
    };
}
