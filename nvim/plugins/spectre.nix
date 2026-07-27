{

  plugins.spectre = {
    enable = true;
    lazyLoad.settings.cmd = "Spectre";
  };

  extraConfigLua = # lua
    ''
      map("n", "<leader>S", '<Cmd>lua require("spectre").toggle()<CR>', { desc = "Spectre" })
    '';

}
