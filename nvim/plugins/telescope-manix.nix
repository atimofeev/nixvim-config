{ pkgs, ... }: {

  extraPlugins = with pkgs.vimPlugins; [{ plugin = telescope-manix; }];
  extraConfigLua = # lua
    ''
      require("telescope").load_extension("manix")

      vim.keymap.set('n','<leader>fm','<Cmd>Telescope manix<CR>',{noremap = true, silent = true, desc = 'Find Nix options'})
    '';

}
