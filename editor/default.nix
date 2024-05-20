{ pkgs, ... }: {
  imports = [ ./cmp.nix ./code-hl.nix ];

  plugins = {

    better-escape.enable = true;

    nvim-autopairs.enable = true;

    comment-nvim.enable = true;

    undotree.enable = true;

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

  extraPlugins = with pkgs.vimPlugins; [{ plugin = vim-move; }];

  keymaps = [
    {
      mode = [ "v" ];
      key = "<M-h>";
      action = "<gv";
      options.desc = "Move block left";
    }
    {
      mode = [ "v" ];
      key = "<M-l>";
      action = ">gv";
      options.desc = "Move block right";
    }
  ];
}
