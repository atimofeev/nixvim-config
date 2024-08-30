_: {

  plugins.todo-comments = {
    enable = true;
    keywords.NOTE.icon = "";
  };

  keymaps = [{
    mode = "n";
    key = "<leader>ft";
    action = "<cmd> TodoTelescope <cr>";
    options.desc = "Find TODOs";
  }];

}
