{
  description = "A NeoVim configuration system for NixOS";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    nixvim = {
      url =
        "github:nix-community/nixvim?rev=c0ea106b4bdf8707837bb0d80efd6affbc128bdf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, flake-parts, ... }@inputs:
    let config = import ./main.nix; # nixvim config file
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
              (final: _prev: {
                master = import inputs.nixpkgs-master {
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
