{ pkgs, ... }: {
  extraPlugins = [{ plugin = pkgs.vimPlugins.otter-nvim; }];
  autoCmd = [{
    event = [ "BufEnter" ];
    pattern = [ "*.nix" ];
    command = # lua
      ''
        lua require("otter").activate({"python", "lua", "bash"}, true, true, nil)'';
  }];

  plugins.cmp.settings.sources = [{ name = "otter"; }];

  # NOTE: otter.nvim: https://github.com/nix-community/nixvim/pull/1768

}
