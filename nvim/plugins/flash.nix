{

  plugins.flash = {
    enable = true;
    settings = {
      modes = {
        search = {
          enabled = false;
        };
        char = {
          enabled = false;
        };
      };
    };
  };

  extraConfigLua = # lua
    ''
      map({ "n", "x", "o" }, "gz", '<Cmd>lua require("flash").jump()<CR>', { desc = "Flash jump" })
      map({ "n", "x", "o" }, "gZ", '<Cmd>lua require("flash").treesitter()<CR>', { desc = "Flash treesitter" })
    '';

}
