{ ... }: {
  plugins = {

    neogit = {
      enable = true;
      settings = {
        auto_refresh = true;
        disable_hint = true;
        disable_signs = true;
        mappings = {
          commit_editor = {
            q = "Close";
            "<M-c>" = "Submit";
            "<M-k>" = "Abort";
          };
          popup = {
            p = "PushPopup";
            P = "PullPopup";
          };
        };
      };
    };

    gitsigns = {
      enable = true;
      currentLineBlame = true;
    };
  };
}
