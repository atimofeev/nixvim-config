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

      highlight.enable = true;

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
