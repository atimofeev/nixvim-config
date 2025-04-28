{ lib, ... }: {

  plugins.diffview = {
    enable = true;
    keymaps = let
      closeDiffviewMap = [{
        key = "q";
        mode = "n";
        action = "<Cmd>DiffviewClose<CR>";
        description = "Close Diffview";
      }];
      diffviewContexts = [
        "diff1"
        "diff2"
        "diff3"
        "diff4"
        "view"
        "filePanel"
        "fileHistoryPanel"
      ];
    in lib.genAttrs diffviewContexts (_contextName: closeDiffviewMap);
  };

}
