_: {

  plugins.todo-comments = {
    enable = true;
    settings.keywords.NOTE.icon = "";
  };

  extraConfigLua = # lua
    ''
      vim.keymap.set("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", { noremap = true, silent = true, desc = "Find TODOs" })
    '';

}
