{

  plugins.harpoon.enable = true;

  extraConfigLua = # lua
    ''
      map("n", "<leader>hx", '<Cmd>lua require("harpoon.mark").add_file()<CR>', { desc = "Harpoon Mark" })
      map("n", "<leader>hn", '<Cmd>lua require("harpoon.ui").nav_next()<CR>', { desc = "Harpoon Next" })
      map("n", "<leader>hp", '<Cmd>lua require("harpoon.ui").nav_prev()<CR>', { desc = "Harpoon Previous" })
      map("n", "<leader>hl", '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = "Harpoon List" })
    '';

}
