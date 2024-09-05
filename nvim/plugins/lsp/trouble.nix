_: {

  plugins.trouble = {
    enable = true;
    settings.use_diagnostic_signs = true;
  };

  autoCmd = [{
    event = [ "BufEnter" ];
    pattern = [ "Trouble" ];
    command = "setlocal wrap";
  }];

  keymaps = [{
    mode = "n";
    key = "<leader>ld";
    action = "<cmd> Trouble diagnostics toggle <cr>";
    options.desc = "LSP diagnostics";
  }];

}
