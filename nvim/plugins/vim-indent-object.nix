{ pkgs, ... }: {

  # NOTE: helps with yaml selection
  extraPlugins = with pkgs.vimPlugins; [{ plugin = vim-indent-object; }];

}
