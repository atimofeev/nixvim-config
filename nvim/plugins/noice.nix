{

  plugins.noice = {
    enable = true;
    settings = {
      routes = [{
        filter = [{
          event = "msg_show";
          any = [
            { find = "%d fewer lines"; }
            { find = "%d more lines"; }
            { find = "%d lines yanked"; }
          ];
        }];
      }];
    };
  };

}
