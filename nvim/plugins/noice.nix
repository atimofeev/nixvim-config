{

  plugins.noice = {
    enable = true;
    settings = {
      notify.enabled = false;
      presets = {
        lsp_doc_border = true;
      };
      routes = [
        # NOTE: show macro recording notification
        {
          filter.any = [
            {
              event = "msg_showmode";
              find = "recording";
            }
          ];
          view = "notify";
        }
        # NOTE: hide useless notifications
        {
          filter = {
            event = "msg_show";
            any = [
              { find = "%d fewer lines"; }
              { find = "%d more lines"; }
              { find = "%d lines yanked"; }
              { find = "--No lines in buffer--"; }
            ];
          };
          opts.skip = true;
        }
        # NOTE: hide useless notifications
        {
          filter = {
            event = "notify";
            find = "No information available";
          };
          opts.skip = true;
        }
      ];
    };
  };

}
