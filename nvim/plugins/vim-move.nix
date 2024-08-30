{ pkgs, ... }: {

  extraPlugins = with pkgs.vimPlugins; [{ plugin = vim-move; }];
}
