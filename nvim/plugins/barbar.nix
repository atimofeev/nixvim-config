_: {

  plugins.barbar.enable = true;

  extraConfigLua = # lua
    ''
      vim.keymap.set('n','<Tab>','<Cmd>BufferNext<CR>',{noremap = true, silent = true, desc = 'Next buffer'})
      vim.keymap.set('n','<S-Tab>','<Cmd>BufferPrevious<CR>',{noremap = true, silent = true, desc = 'Previous buffer'})
    '';

}
