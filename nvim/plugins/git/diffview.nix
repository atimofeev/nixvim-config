{ lib, ... }:
{

  plugins.diffview = {
    enable = true;

    settings.keymaps =
      let
        closeDiffviewMap = [
          {
            key = "q";
            mode = "n";
            action = "<Cmd>DiffviewClose<CR>";
            description = "Close Diffview";
          }
        ];
        diffviewContexts = [
          "diff1"
          "diff2"
          "diff3"
          "diff4"
          "file_history_panel"
          "file_panel"
          "view"
        ];
      in
      lib.genAttrs diffviewContexts (_contextName: closeDiffviewMap);

  };

}
