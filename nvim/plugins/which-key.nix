_: {

  plugins.which-key = {
    enable = true;
    settings.icons.mappings = false;
  };

  extraConfigLua = # lua
    ''
      require("which-key").add({
        {"<leader>l", group = "+lsp"},
        {"<leader>f", group = "+find"},
        {"<leader>fg", group = "+git"},
        {"<leader>t", group = "+term"},
        {"<leader>h", group = "+harpoon"},
        {"<leader>n", group = "+notes"},
        {"gz", group = "+surround"},
      })
    '';

}
