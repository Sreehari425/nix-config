{
  description = "Sreehari's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
      lanzaboote,
      ...
    }: # Destructure nixgl here
    let
      system = "x86_64-linux";
      homePkgs = import nixpkgs ({ inherit system; } // (import ./home/home-packages.nix));

      systemPkgs = import nixpkgs ({ inherit system; } // (import ./nixos/system-packages.nix));

    in
    {
      homeConfigurations.sreehari-standalone = home-manager.lib.homeManagerConfiguration {

        pkgs = homePkgs;

        # Pass nixgl down into your modules so modules/kitty.nix can read it
        extraSpecialArgs = {
          inherit nixgl;
          quantumLauncher = quantum-launcher;
          isNixOS = false;
        };

        modules = [
          catppuccin.homeModules.catppuccin # for rofi powermenu.sh
          ./home/home.nix
        ];
      };
      homeConfigurations.sreehari-nixos = home-manager.lib.homeManagerConfiguration {

        pkgs = homePkgs;

        extraSpecialArgs = {
          inherit nixgl;
          quantumLauncher = quantum-launcher;
          isNixOS = true;
        };

        modules = [
          catppuccin.homeModules.catppuccin # for rofi powermenu.sh
          ./home/home.nix
        ];
      };

      nixosConfigurations.tp-orion = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/configuration.nix
          ./nixos/hosts/tp-orion
          lanzaboote.nixosModules.lanzaboote
          { nixpkgs.pkgs = systemPkgs; }
        ];
      };

    };

}
