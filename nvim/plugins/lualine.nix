_: {
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
        fmt = # lua
          ''
            function(str)
               if str:len() > 25 then
                  return str:sub(1, 25) .. '>'
               end
               return str
            end
          '';
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
  };

}
