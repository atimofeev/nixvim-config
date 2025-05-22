_: {

  plugins.which-key = {
    enable = true;
    settings.icons.mappings = false;
  };

  extraConfigLua = # lua
    ''
      require("which-key").add {
        { "<leader>c", group = "+copy" },
        { "<leader>f", group = "+find" },
        { "<leader>fg", group = "+git" },
        { "<leader>h", group = "+harpoon" },
        { "<leader>l", group = "+lsp" },
        { "<leader>n", group = "+notes" },
        { "<leader>s", group = "+set" },
        { "<leader>t", group = "+toggle" },
        { "gz", group = "+flash" },
      }
    '';

}
