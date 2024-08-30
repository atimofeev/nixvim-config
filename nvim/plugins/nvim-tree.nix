_: {

  plugins.nvim-tree = {
    enable = true;
    # autoClose = true;
    syncRootWithCwd = true;
    respectBufCwd = true;
    updateFocusedFile.enable = true;
    updateFocusedFile.updateRoot = true;
    git.ignore = false;
    filters.custom =
      [ "^\\.git$" "^\\.mypy_cache$" "^\\.terraform$" "^\\.null-ls_" ];
    renderer = {
      highlightGit = true;
      icons.gitPlacement = "after";
      icons.glyphs.git.unstaged = "•";
    };
  };

  keymaps = [{
    mode = "n";
    key = "<leader>e";
    action = "<cmd> NvimTreeFocus <cr>";
    options.desc = "Focus nvimtree";
  }];

}
