_: {

  plugins.snacks = {
    enable = true;
    settings = {
      bigfile = { enabled = true; };
      notifier = {
        enabled = true;
        timeout = 6000;
      };
      words = { enabled = false; };
    };
  };

}
