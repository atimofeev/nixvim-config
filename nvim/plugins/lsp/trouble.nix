_: {

  plugins.trouble = {
    enable = true;
    settings.use_diagnostic_signs = true;
  };

  extraConfigLua = # lua
    ''
      vim.keymap.set('n','<leader>ld','<Cmd>Trouble diagnostics toggle<CR>',{noremap = true, silent = true, desc = 'LSP diagnostics'})
    '';

  autoCmd = [{
    event = [ "BufEnter" ];
    pattern = [ "Trouble" ];
    command = "setlocal wrap";
  }];

}
