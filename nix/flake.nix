{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
