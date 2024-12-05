_:
let flake = ''(builtins.getFlake "/home/atimofeev/repos/nixos-config")'';
in {
  plugins.lsp.servers.nixd = {
    enable = true;
    settings = {
      nixpkgs.expr = "import ${flake}.inputs.nixpkgs {}";
      options = rec {
        nixos.expr = "${flake}.nixosConfigurations.default.options";
        home-manager.expr =
          "${nixos.expr}.home-manager.users.type.getSubOptions []";
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
