{
  description = "A NeoVim configuration system for NixOS";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, flake-parts, ... }@inputs:
    let config = import ./nvim; # nixvim config file
    in flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { pkgs, system, ... }:
        let
          nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = config;
          };
        in {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [
              (final: _prev: {
                stable = import inputs.nixpkgs-stable {
                  inherit (final) system;
                  config.allowUnfree = true;
                };
              })
            ];
          };

          packages.default = nvim; # 'nix run .' to start nixvim
        };
    };
}
