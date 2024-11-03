_: {
  plugins.lsp.servers.nixd = {
    enable = true;
    settings = {
      nixpkgs.expr = ''
        import (builtins.getFlake "/home/atimofeev/repos/nixos-config").inputs.nixpkgs { }'';
      options = {
        nixos.expr = ''
          (builtins.getFlake "/home/atimofeev/repos/nixos-config").nixosConfigurations.default.options'';
        # home-manager.expr = ''
        #   (builtins.getFlake "/home/atimofeev/repos/nixos-config").homeConfigurations."atimofeev@default".options'';
        # nixvim.expr = ''
        #   (builtins.getFlake "/home/atimofeev/repos/nixvim-config").homeConfigurations."atimofeev@default".options'';
      };
    };
  };
}
