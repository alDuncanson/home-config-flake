{
  description = "Environment flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "aarch64-darwin";

      mkHomeConfig =
        username:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit system username; };
          modules = [
            ({ config, ... }: { nixpkgs.config.allowUnfree = true; })
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
