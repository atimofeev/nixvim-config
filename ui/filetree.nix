{ ... }: {
  plugins.nvim-tree = {
    enable = true;
    autoClose = true;
    syncRootWithCwd = true;
    respectBufCwd = true;
    updateFocusedFile.enable = true;
    updateFocusedFile.updateRoot = true;
    git.ignore = false;
    filters.custom = [ "^\\.git$" "^\\.mypy_cache$" "^\\.terraform$" ];
    renderer = {
      highlightGit = true;
      icons.gitPlacement = "after";
      icons.glyphs.git.unstaged = "•";
    };
    # TODO: implement dynamic sizing of float window
    # https://www.reddit.com/r/neovim/comments/13u9okq/nvimtree_vs_neotree/
    # https://github.com/MarioCarrion/videos/blob/269956e913b76e6bb4ed790e4b5d25255cb1db4f/2023/01/nvim/lua/plugins/nvim-tree.lua
    # view.float.enable = true;
    # view.float.openWinConfig = {
    #   relative = "editor";
    #   border = "rounded";
    #   width = 40;
    #   height = 100000;
    # };
  };

}
