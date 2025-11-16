{

  plugins.barbar.enable = true;

  extraConfigLua = # lua
    ''
      map("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
      map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
    '';

}
