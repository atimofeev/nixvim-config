{ pkgs, ... }: {

  # NOTE: fix for yaml blocks
  extraPlugins = with pkgs.vimPlugins; [{ plugin = vim-indent-object; }];

}
