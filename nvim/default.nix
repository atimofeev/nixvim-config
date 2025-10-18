{ pkgs, ... }:
{

  imports = [
    ./plugins
    ./autocmd.nix
    ./filetype.nix
    ./keymap.nix
    ./options.nix
  ];

  extraPackages = with pkgs; [ xclip ];

  clipboard.register = "unnamedplus";

}
