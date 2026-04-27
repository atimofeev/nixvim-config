{

  plugins.treesitter-textobjects = {
    enable = true;
    settings = {

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

      swap = {
        enable = true;
        swapNext = {
          "gwa" = "@parameters.inner";
          "gwf" = "@function.outer";
        };
        swapPrevious = {
          "gwA" = "@parameter.outer";
          "gwF" = "@function.outer";
        };
      };

    };
  };

}
