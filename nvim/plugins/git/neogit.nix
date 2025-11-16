{

  plugins.neogit = {
    enable = true;
    settings = {
      auto_refresh = true;
      disable_hint = true;
      disable_signs = true;
      status.recent_commit_count = 30;
      integrations = {
        diffview = true;
      };
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

  extraConfigLua = # lua
    ''
      map("n", "<leader>g", "<Cmd>Neogit<CR>", { desc = "Open Neogit" })
    '';

  autoCmd = [
    {
      event = [ "BufEnter" ];
      pattern = [ "Neogit*" ];
      command = "setlocal foldcolumn=0";
    }
  ];

}
