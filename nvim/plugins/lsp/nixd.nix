{ inputs, pkgs, ... }:
let
  nixos-flake = ''(builtins.getFlake "${inputs.nixos-config.outPath}")'';
  nixvim-flake = ''(builtins.getFlake "${inputs.self.outPath}")'';
in {
  plugins.lsp.servers.nixd = {
    enable = true;
    settings = {
      nixpkgs.expr = "import ${nixos-flake}.inputs.nixpkgs {}";
      options = rec {
        nixos.expr = "${nixos-flake}.nixosConfigurations.milaptop.options";
        home-manager.expr =
          "${nixos.expr}.home-manager.users.type.getSubOptions []";
        nixvim.expr = "${nixvim-flake}.packages.${pkgs.system}.default.options";
      };
    };
  };
}
