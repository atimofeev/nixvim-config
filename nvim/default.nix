_: {

  imports = [
    ./plugins
    ./autocmd.nix
    ./filetype.nix
    ./keymap.nix
    ./options.nix
  ];

  clipboard.register = "unnamedplus";

}
