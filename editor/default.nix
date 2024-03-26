{ pkgs, ... }: {
  imports = [ ./cmp.nix ./code-hl.nix ];

  plugins = {

    # TODO: upgrade when https://github.com/max397574/better-escape.nvim/pull/59 is merged
    better-escape.enable = true;

    nvim-autopairs.enable = true;

    comment-nvim.enable = true;

    # TODO: upgrade when https://github.com/yamatsum/nvim-cursorline/issues/10 is resolved
    cursorline = {
      enable = true;
      cursorline.enable = false;
    };

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

  autoCmd = [{
    event = "TextYankPost"; # highlight yanked text
    group = "highlight_yank";
    command =
      "silent! lua vim.highlight.on_yank{higroup='Search', timeout=300}";
  }];
  autoGroups.highlight_yank.clear = true;

  extraPlugins = with pkgs.vimPlugins;
  #   let
  #     move-nvim = pkgs.vimUtils.buildVimPlugin {
  #       name = "move.nvim";
  #       src = pkgs.fetchFromGitHub {
  #         owner = "fedepujol";
  #         repo = "move.nvim";
  #         rev = "cccbd4ea9049ca5f99f025ffaddb7392359c7d6a";
  #         hash = "sha256-aJi7r9yPdQyH6i8EtQzKdRhEQ3SLz32oqcN0tf2qRZA=";
  #       };
  #     };
  #   in 
    [
      # {
      #   plugin = move-nvim;
      #   config = ''lua require("move").setup()'';
      # }
      { plugin = vim-move; }
    ];

  # FIX: remap has no effect
  # https://github.com/matze/vim-move/blob/516a47e8365a7664a8691d306d5ec91a6f5e5772/plugin/move.vim
  keymaps = [
    {
      mode = [ "v" ];
      key = "<M-h>";
      action = "<gv";
      options = {
        desc = "Move block left";

      };
    }
    {
      mode = [ "v" ];
      key = "<M-l>";
      action = ">gv";
      options.desc = "Move block right";
    }
  ];
}
