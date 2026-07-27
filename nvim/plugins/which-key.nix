{

  plugins.which-key = {
    enable = true;
    lazyLoad.settings.event = "UIEnter";
    settings.icons.mappings = false;
    # NOTE: use luaConfig.post so this runs after which-key is loaded (lazy-aware)
    luaConfig.post = # lua
      ''
        require("which-key").add {
          { "<leader>c", group = "+copy" },
          { "<leader>f", group = "+find" },
          { "<leader>fg", group = "+git" },
          { "<leader>h", group = "+harpoon" },
          { "<leader>l", group = "+lsp" },
          { "<leader>n", group = "+notes" },
          { "<leader>t", group = "+toggle" },
          { "gz", group = "+flash" },
        }
      '';
  };

  highlightOverride.WhichKeyNormal = {
    fg = "#cad3f5";
    bg = "#1e2030";
  };

}
