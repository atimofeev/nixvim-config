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
}
