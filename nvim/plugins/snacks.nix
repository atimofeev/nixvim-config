_: {

  plugins.snacks = {
    enable = true;
    luaConfig.pre = # lua
      ''
        require('snacks').setup({
          bigfile = { enabled = true },
          notifier = {
            enabled = true,
            timeout = 6000,
          },
          words = { enabled = false },
        })'';
  };

}
