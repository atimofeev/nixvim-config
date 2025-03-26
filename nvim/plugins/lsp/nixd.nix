{ system, ... }:
let
  nixos-flake = ''(builtins.getFlake "/home/atimofeev/repos/nixos-config")'';
  nixvim-flake = ''(builtins.getFlake "/home/atimofeev/repos/nixvim-config")'';
in {
  plugins.lsp.servers.nixd = {
    enable = true;
    settings = {
      nixpkgs.expr = "import ${nixos-flake}.inputs.nixpkgs {}";
      options = rec {
        nixos.expr = "${nixos-flake}.nixosConfigurations.default.options";
        home-manager.expr =
          "${nixos.expr}.home-manager.users.type.getSubOptions []";
        # NOTE: how do I pass current system here?
        # nixvim.expr = "${nixvim-flake}.packages.${system}.default.options";
        # FIX:
        # nixvim.expr =
        #   ''"(${home-manager.expr}).programs.nixvim.type.getSubOptions []"'';
        # nixvim.expr = ''
        #   "((builtins.getFlake "/home/atimofeev/repos/nixos-config").nixosConfigurations.default.options.home-manager.users.type.getSubOptions []).programs.nixvim.type.getSubOptions []"
        # '';
      };
    };
  };
}
