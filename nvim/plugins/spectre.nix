{ pkgs, ... }: {

  extraPlugins = with pkgs.vimPlugins; [{ plugin = nvim-spectre; }];

  extraConfigLua = # lua
    ''
      vim.keymap.set('n','<leader>S','<Cmd>lua require("spectre").toggle()<CR>',{noremap = true, silent = true, desc = 'Spectre'})
    '';

}
