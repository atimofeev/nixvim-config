{

  plugins.trouble = {
    enable = true;
    lazyLoad.settings.cmd = "Trouble";
  };

  extraConfigLua = # lua
    ''
      map("n", "<leader>ld", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "LSP diagnostics" })
    '';

  autoCmd = [
    {
      event = [ "BufEnter" ];
      pattern = [ "Trouble" ];
      command = "setlocal wrap";
    }
  ];

}
