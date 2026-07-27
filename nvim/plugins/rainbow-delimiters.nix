{

  plugins.rainbow-delimiters = {
    enable = true;
    lazyLoad.settings.event = "BufReadPost";
    settings.query = {
      "" = "rainbow-delimiters";
      lua = "rainbow-blocks";
    };
  };

}
