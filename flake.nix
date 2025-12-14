{
  description = "Modular NixOS Configuration with Specialisations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }: {
    nixosConfigurations.i-use-nixos-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [ nur.overlays.default ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}
