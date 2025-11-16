{

  plugins.spectre.enable = true;

  extraConfigLua = # lua
    ''
      map("n", "<leader>S", '<Cmd>lua require("spectre").toggle()<CR>', { desc = "Spectre" })
    '';

}
