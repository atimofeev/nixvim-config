{

  plugins.nvim-tree = {
    enable = true;
    # autoClose = true;
    syncRootWithCwd = true;
    respectBufCwd = true;
    git.ignore = false;

    updateFocusedFile = {
      enable = true;
      updateRoot = true;
    };

    filters.custom = [
      "^\\.git$"
      "^\\.mypy_cache$"
      "^\\.terraform$"
      "^\\.null-ls_"
      "^\\.stfolder$"
      "^\\.obsidian$"
    ];

    renderer = {
      highlightGit = true;
      icons = {
        gitPlacement = "after";
        glyphs.git.unstaged = "•";
      };
    };

  };

  extraConfigLua = # lua
    ''
      vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeFocus<CR>", { noremap = true, silent = true, desc = "Open NvimTree" })
    '';

}
