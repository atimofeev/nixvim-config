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
              local utils = require("catppuccin.utils.colors")

              return {
                NeojjBranch = { fg = colors.peach, style = { "bold" } },
                NeojjRemote = { fg = colors.green, style = { "bold" } },
                NeojjObjectId = { link = "Comment" },
                NeojjHunkHeader = {
                  bg = utils.darken(colors.blue, 0.095, colors.base),
                  fg = utils.darken(colors.blue, 0.5, colors.base),
                },
                NeojjHunkHeaderHighlight = {
                  bg = utils.darken(colors.blue, 0.215, colors.base),
                  fg = colors.blue,
                },
                NeojjDiffContextHighlight = { bg = colors.surface0 },
                NeojjDiffDeleteHighlight = {
                  bg = utils.darken(colors.red, 0.345, colors.base),
                  fg = utils.lighten(colors.red, 0.85, colors.text),
                },
                NeojjDiffAddHighlight = {
                  bg = utils.darken(colors.green, 0.345, colors.base),
                  fg = utils.lighten(colors.green, 0.85, colors.text),
                },
                NeojjDiffDelete = {
                  bg = utils.darken(colors.red, 0.095, colors.base),
                  fg = utils.darken(colors.red, 0.8, colors.base),
                },
                NeojjDiffAdd = {
                  bg = utils.darken(colors.green, 0.095, colors.base),
                  fg = utils.darken(colors.green, 0.8, colors.base),
                },
                NeojjCommitViewHeader = {
                  bg = utils.darken(colors.blue, 0.3, colors.base),
                  fg = utils.lighten(colors.blue, 0.8, colors.text),
                },
                NeojjChangeModified = { fg = colors.blue, style = { "bold" } },
                NeojjChangeDeleted = { fg = colors.red, style = { "bold" } },
                NeojjChangeAdded = { fg = colors.green, style = { "bold" } },
                NeojjChangeRenamed = { fg = colors.mauve, style = { "bold" } },
                NeojjChangeUpdated = { fg = colors.peach, style = { "bold" } },
                NeojjChangeCopied = { fg = colors.pink, style = { "bold" } },
                NeojjChangeUnmerged = { fg = colors.yellow, style = { "bold" } },
                NeojjChangeNewFile = { fg = colors.green, style = { "bold" } },
                NeojjRecentcommits = { fg = colors.mauve, style = { "bold" } },
                NeojjGraphRed = { fg = colors.red },
                NeojjGraphWhite = { fg = colors.base },
                NeojjGraphYellow = { fg = colors.yellow },
                NeojjGraphGreen = { fg = colors.green },
                NeojjGraphCyan = { fg = colors.blue },
                NeojjGraphBlue = { fg = colors.blue },
                NeojjGraphPurple = { fg = colors.lavender },
                NeojjGraphGray = { fg = colors.subtext1 },
                NeojjGraphOrange = { fg = colors.peach },
                NeojjGraphBoldRed = { fg = colors.red, style = { "bold" } },
                NeojjGraphBoldWhite = { fg = colors.white, style = { "bold" } },
                NeojjGraphBoldYellow = { fg = colors.yellow, style = { "bold" } },
                NeojjGraphBoldGreen = { fg = colors.green, style = { "bold" } },
                NeojjGraphBoldCyan = { fg = colors.blue, style = { "bold" } },
                NeojjGraphBoldBlue = { fg = colors.blue, style = { "bold" } },
                NeojjGraphBoldPurple = { fg = colors.lavender, style = { "bold" } },
                NeojjGraphBoldGray = { fg = colors.subtext1, style = { "bold" } },
                NeojjDiffContext = { bg = colors.base },
                NeojjPopupBold = { style = { "bold" } },
                NeojjPopupSwitchKey = { fg = colors.lavender },
                NeojjPopupOptionKey = { fg = colors.lavender },
                NeojjPopupConfigKey = { fg = colors.lavender },
                NeojjPopupActionKey = { fg = colors.lavender },
                NeojjFilePath = { fg = colors.blue, style = { "italic" } },
                NeojjDiffHeader = { bg = colors.base, fg = colors.blue, style = { "bold" } },
                NeojjDiffHeaderHighlight = { bg = colors.base, fg = colors.peach, style = { "bold" } },
                NeojjFold = { fg = colors.none, bg = colors.none },
                NeojjSectionHeader = { fg = colors.mauve, style = { "bold" } },
                NeojjTagName = { fg = colors.yellow },
                NeojjTagDistance = { fg = colors.blue },
                NeojjWinSeparator = { link = "WinSeparator" },
                NeojjFileMode = { fg = colors.mauve, style = { "bold" } },
              }
            end
          '';
      };
    };
  };

}
