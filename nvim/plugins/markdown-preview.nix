{

  plugins.markdown-preview = {
    enable = true;
    lazyLoad.settings.ft = "markdown";
  };

  extraConfigLua = # lua
    ''
      vim.g.mkdp_port = "9898"
    '';

}
