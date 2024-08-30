{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [{ plugin = telescope-manix; }];
  extraConfigLua = ''require("telescope").load_extension("manix")'';

  keymaps = [{
    mode = "n";
    key = "<leader>fm";
    action = "<cmd> Telescope manix <cr>";
    options.desc = "Find Nix options";
  }];
}
