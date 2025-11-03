{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  nixos-flake = ''(builtins.getFlake "${inputs.nixos-config.outPath}")'';
  nixvim-flake = ''(builtins.getFlake "${inputs.self.outPath}")'';
in
{
  plugins.lsp.servers = {
    nil_ls = {
      enable = true;
      onAttach.function = # lua
        ''
          client.server_capabilities.semanticTokensProvider = nil
        '';
    };
    nixd = {
      enable = true;
      cmd = [
        (lib.getExe pkgs.nixd)
        "--semantic-tokens=true" # https://github.com/nix-community/nixd/issues/604
      ];
      settings = {
        nixpkgs.expr = "import ${nixos-flake}.inputs.nixpkgs {}";
        options = rec {
          nixos.expr = "${nixos-flake}.nixosConfigurations.milaptop.options";
          home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions []";
          nixvim.expr = "${nixvim-flake}.packages.${pkgs.stdenv.hostPlatform.system}.default.options";
        };
      };
    };
  };
}
