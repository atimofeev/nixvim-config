_: {

  plugins.markdown-preview.enable = true;

  extraConfigLua = # lua
    ''
      vim.g.mkdp_port = "9898"
    '';

}
