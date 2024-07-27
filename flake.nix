{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    helix.url = "github:helix-editor/helix/master";
  };

  outputs = inputs@{ nixpkgs, home-manager, hyprland, ... }: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # pkgs = nixpkgs.legacyPackages.${system};
        specialArgs = { inherit inputs; };
        modules = [
          # ./hosts/default/configuration.nix
          ./hosts/default

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # home-manager.extraSpecialArgs = inputs;
            home-manager.users.mredrup = import ./home;
          }
        ];
      };
    };

  };
}
