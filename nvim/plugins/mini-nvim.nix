_: {

  plugins.mini = {
    enable = true;
    modules = {

      cursorword.delay = 0;

      move = { };

      surround = {
        mappings = {
          suffix_last = "N"; # Suffix to search with "prev" method
          suffix_next = "n"; # Suffix to search with "next" method
        };
        # Number of lines within which surrounding is searched
        n_lines = 45;
      };

    };
  };

}
