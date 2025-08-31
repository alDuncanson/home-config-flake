{
  description = "Environment flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nvf,
    ...
  }: {
    homeConfigurations = {
      al = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = { system = "aarch64-darwin"; username = "al"; };
        modules = [
          ({config, ...}: {nixpkgs.config.allowUnfree = true;})
          nvf.homeManagerModules.default
          ./home.nix
        ];
      };
    };
  };
}
