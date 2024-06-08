{
  description = "A NeoVim configuration system for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
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
          };

          packages.default = nvim; # 'nix run .' to start nixvim
        };
    };
}
