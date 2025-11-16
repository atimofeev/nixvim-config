{

  plugins.trouble.enable = true;

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
