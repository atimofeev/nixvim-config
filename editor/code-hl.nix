{ ... }: {
  plugins = {

    treesitter.enable = true;

    todo-comments.enable = true;

    nvim-colorizer.enable = true;

    indent-blankline = {
      enable = true;
      scope.showStart = false;
    };

    rainbow-delimiters = {
      enable = true;
      query = {
        default = "rainbow-delimiters";
        lua = "rainbow-blocks";
      };
    };

  };
}
