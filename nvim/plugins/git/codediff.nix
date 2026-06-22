{

  # TODO: configure
  # https://github.com/esmuellert/codediff.nvim

  plugins.codediff = {
    enable = true;
    lazyLoad.settings.event = "BufReadPost";
    settings.keymaps = {
      explorer.refresh = "<C-r>";
      view = {
        next_file = "<C-n>";
        prev_file = "<C-p>";
      };
    };

  };

}
