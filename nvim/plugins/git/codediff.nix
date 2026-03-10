{

  # TODO: configure
  # https://github.com/esmuellert/codediff.nvim

  plugins.codediff = {
    enable = true;
    settings.keymaps = {
      explorer.refresh = "<C-r>";
      view = {
        next_file = "<C-n>";
        prev_file = "<C-p>";
      };
    };

  };

}
