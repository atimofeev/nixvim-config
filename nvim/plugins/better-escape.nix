_: {

  plugins.better-escape = {
    enable = true;
    settings = {
      timeout = 200;
      mappings = {
        i = { j = { k = "<Esc>"; }; };
        v = { j = { k = "<Esc>"; }; };
        t = { j = { k = "<C-\\><C-n>"; }; };
      };
    };
  };

}
