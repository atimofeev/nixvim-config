{

  colorschemes = {
    catppuccin = {
      enable = true;
      lazyLoad.enable = true;
      settings = {
        flavour = "mocha";
        custom_highlights.__raw = # lua
          ''
            function(colors)
              return {
                NeojjChangeModified = { fg = colors.blue, style = { "bold" } },
                NeojjChangeDeleted = { fg = colors.red, style = { "bold" } },
                NeojjChangeAdded = { fg = colors.green, style = { "bold" } },
                NeojjChangeRenamed = { fg = colors.mauve, style = { "bold" } },
                NeojjChangeUpdated = { fg = colors.peach, style = { "bold" } },
                NeojjChangeCopied = { fg = colors.pink, style = { "bold" } },
                NeojjChangeUnmerged = { fg = colors.yellow, style = { "bold" } },
                NeojjChangeNewFile = { fg = colors.green, style = { "bold" } },
                NeojjFileMode = { fg = colors.mauve, style = { "bold" } },
              }
            end
          '';
      };
    };
  };

}
