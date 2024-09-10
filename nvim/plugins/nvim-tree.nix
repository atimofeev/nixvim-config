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
    notify.threshold = "warn";
  };

  extraConfigLua = # lua
    ''
      vim.keymap.set('n','<leader>e','<Cmd>NvimTreeFocus<CR>',{noremap = true, silent = true, desc = 'Open NvimTree'})
    '';

}
