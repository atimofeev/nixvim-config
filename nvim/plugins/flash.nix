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

  extraConfigLua = # lua
    ''
      vim.keymap.set({'n','x','o'},'s','<Cmd>lua require("flash").jump()<CR>',{noremap = true, silent = true, desc = 'Flash jump'})
      vim.keymap.set({'n','x','o'},'S','<Cmd>lua require("flash").treesitter()<CR>',{noremap = true, silent = true, desc = 'Flash treesitter'})
    '';

}
