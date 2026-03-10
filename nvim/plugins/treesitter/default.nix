{ pkgs, ... }:
{

  imports = [
    ./rainbow-delimiters.nix
    ./textobjects.nix
  ];

  extraPackages = with pkgs; [
    gcc
    tree-sitter
  ];

  plugins.treesitter = {
    enable = true;
    # indent = true;
    nixvimInjections = true;
    languageRegister = {
      hcl = [ "terraform-vars" ];
      bash = [ "conf" ];
    };

    settings = {

      highlight = {
        enable = true;
        # BUG: not effective
        # https://github.com/nix-community/nixvim/issues/4163
        disable = [ "nginx" ];
      };

      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          node_decremental = "<bs>";
        };
      };
    };

  };

}
