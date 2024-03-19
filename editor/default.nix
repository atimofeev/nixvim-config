{ ... }: {
  imports = [ ./cmp.nix ./code-hl.nix ];

  plugins = {

    better-escape.enable = true;

    autoclose.enable = true;

    comment-nvim.enable = true;

    mini = {
      enable = true;
      modules.surround = {
        mappings = { # fix KB collision with leap.nvim
          add = "gza"; # Add surrounding in Normal and Visual modes
          delete = "gzd"; # Delete surrounding
          find = "gzf"; # Find surrounding (to the right)
          find_left = "gzF"; # Find surrounding (to the left)
          highlight = "gzh"; # Highlight surrounding
          replace = "gzr"; # Replace surrounding
          update_n_lines = "gzn"; # Update `n_lines`
        };
      };
    };

    # TODO: setup these plugins
    leap.enable = true;
    harpoon = {
      enable = true;
      enableTelescope = true;
    };

  };

  extraPlugins = with pkgs.vimPlugins; [{
    plugin = vim-move;
    # config = ''lua require("Comment").setup()'';
  }];
  # FIX:
  # extraPlugins = [
  #   (pkgs.vimUtils.buildVimPlugin {
  #     name = "move.nvim";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "fedepujol";
  #       repo = "move.nvim";
  #       rev = "cccbd4ea9049ca5f99f025ffaddb7392359c7d6a";
  #       hash = "sha256-aJi7r9yPdQyH6i8EtQzKdRhEQ3SLz32oqcN0tf2qRZA=";
  #     };
  #   })
  # ];
  # extraConfigLua = ''
  #   require('move').setup({})
  # '';

}
