{
  description = "Environment flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nvf,
      ...
    }:
    let
      system = "aarch64-darwin";

      mkHomeConfig =
        username:
        let
          pkgs = nixpkgs.legacyPackages.${system}; # Define pkgs here
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit system username; };

          modules = [
            nvf.homeManagerModules.default
            ./home.nix
          ];
        };
    in
    {
      homeConfigurations = {
        al = mkHomeConfig "al";
        al_duncanson = mkHomeConfig "al_duncanson";
      };
    };
}
