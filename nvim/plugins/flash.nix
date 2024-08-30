_: {

  plugins.flash = {
    enable = true;
    settings = {
      modes = {
        search.enabled = false;
        char.enabled = false;
      };
    };
  };

  keymaps = [
    {
      mode = [ "n" "x" "o" ];
      key = "s";
      action = "<cmd>lua require('flash').jump()<cr>";
      options.desc = "Flash jump";
    }
    {
      mode = [ "n" "x" "o" ];
      key = "S";
      action = "<cmd>lua require('flash').treesitter()<cr>";
      options.desc = "Flash treesitter";
    }
  ];

}
