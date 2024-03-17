{
  description = "A NeoVim configuration system for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    nixvim.url =
      "github:nix-community/nixvim?rev=bb64e79de67a212edf082fd330bc5a954aded0ba";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, nixvim, flake-parts, ... }@inputs:
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
