{
  description = "A NeoVim configuration in Nix DSL";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # used for nixd
    nixos-config.url = "github:atimofeev/nixos-config";
  };

  outputs =
    {
      flake-parts,
      nixpkgs,
      nixvim,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, system, ... }:
        {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ (import ./overlays) ];
          };

          packages.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = import ./nvim;
            extraSpecialArgs = { inherit inputs; };
          };
        };
    };
}
