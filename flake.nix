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
    helix-fork = {
      url = "github:Sreehari425/helix/40d429de85641fc935d83b6e9cc0f133e4f3e1d5";
      inputs.nixpkgs.follows = "nixpkgs"; # avoid duplicate nixpkgs eval, if your fork's flake takes it
    };

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixgl,
      catppuccin,
      quantum-launcher,
      lanzaboote,
      helix-fork,
      ...

    }: # Destructure nixgl here
    let
      system = "x86_64-linux";
      homePkgs = import nixpkgs (
        { inherit system; } // (import ./home/home-packages.nix) { inherit helix-fork; }
      );

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
        specialArgs = {
          flakeTarget = "tp-orion";
        };

        modules = [
          ./nixos/configuration.nix
          ./nixos/hosts/tp-orion
          lanzaboote.nixosModules.lanzaboote
          { nixpkgs.pkgs = systemPkgs; }
        ];
      };

      nixosConfigurations.pc-phoenix = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          flakeTarget = "pc-phoenix";
        };

        modules = [
          ./nixos/configuration.nix
          ./nixos/hosts/pc-phoenix
          lanzaboote.nixosModules.lanzaboote
          { nixpkgs.pkgs = systemPkgs; }
        ];
      };

    };

}
