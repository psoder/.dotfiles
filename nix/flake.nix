{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }@inputs: {
    # packages."x86_64-linux".default = (nvf.lib.neovimConfiguration {
    #   pkgs = nixpkgs.legacyPackages."x86_64-linux";
    #   modules = ./modules/nvf.nix;
    # });

    nixosConfigurations.orion = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        nvf.nixosModules.default
        ./hosts/orion/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
