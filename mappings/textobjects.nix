{ pkgs, ... }: {
  # NOTE: fix for yaml blocks
  extraPlugins = with pkgs.vimPlugins; [{ plugin = vim-indent-object; }];

  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "aa" = "@parameter.outer";
        "ia" = "@parameter.inner";
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ii" = "@conditional.inner";
        "ai" = "@conditional.outer";
        "il" = "@loop.inner";
        "al" = "@loop.outer";
        "at" = "@comment.outer";
      };
    };

    move = {
      enable = true;
      gotoNextStart = {
        "][" = "@function.outer";
        "]c" = "@class.outer";
      };
      gotoNextEnd = {
        "]]" = "@function.outer";
        "]C" = "@class.outer";
      };
      gotoPreviousStart = {
        "[[" = "@function.outer";
        "[c" = "@class.outer";
      };
      gotoPreviousEnd = {
        "[]" = "@function.outer";
        "[C" = "@class.outer";
      };
    };

    # TODO: figure out sane KBs
    swap = {
      enable = true;
      swapNext = {
        "<leader>a" = "@parameters.inner";
        "<leader>F" = "@function.outer";
      };
      swapPrevious = {
        "<leader>A" = "@parameter.outer";
        "<leader>fF" = "@function.outer";
      };
    };
  };
}
