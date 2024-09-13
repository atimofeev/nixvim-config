{ pkgs, ... }: {

  extraPlugins = with pkgs.vimPlugins; [{ plugin = vim-be-good; }];

}
