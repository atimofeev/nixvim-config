{ pkgs, ... }: {

  extraPlugins = let
    snacks-nvim = pkgs.vimUtils.buildVimPlugin rec {
      name = "snacks.nvim";
      version = "1.2.0";
      src = pkgs.fetchFromGitHub {
        owner = "folke";
        repo = name;
        rev = "v${version}";
        hash = "sha256-WkYz09wtfBn6QoWkWCAPldMveuLCRUdjG5BxTgXatB4=";
      };
    };
  in [{ plugin = snacks-nvim; }];

  extraConfigLua = # lua
    ''
      require('snacks').setup({
        notifier = {
          enabled = true,
          timeout = 6000,
        },
      })
    '';

}
