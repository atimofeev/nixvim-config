{ ... }: {
  plugins.lualine = {
    enable = true;
    globalstatus = true;
    componentSeparators = {
      left = "󰿟";
      right = "";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
    sections.lualine_b = [
      {
        name = "branch";
        icon = "";
      }
      {
        name = "diff";
        extraConfig = {
          symbols = {
            added = "";
            modified = "󰟃";
            removed = "";
          };
        };
      }
      {
        name = "diagnostics";
        extraConfig = {
          symbols = {
            error = "";
            warn = "";
            info = "";
            hint = "";
          };
        };
      }
    ];
    # git branch name limit = 25
  };

}
