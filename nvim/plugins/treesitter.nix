{ pkgs, ... }:
{

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

    highlight = {
      enable = true;
      disable = [ "nginx" ];
    };

  };

}
