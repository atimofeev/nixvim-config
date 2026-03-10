{ config, ... }:
{

  plugins.neogit = {
    enable = true;
    settings = {
      auto_refresh = true;
      disable_hint = true;
      disable_signs = true;
      status.recent_commit_count = 30;
      integrations = {
        codediff = config.plugins.codediff.enable;
        diffview = config.plugins.diffview.enable;
        fzf_lua = config.plugins.fzf-lua.enable;
        mini_pick = config.plugins.mini-pick.enable;
        snacks = config.plugins.snacks.enable;
        telescope = config.plugins.telescope.enable;
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

}
