_: {

  plugins.project-nvim = {
    enable = true;
    settings = {
      patterns = [ ".git" ".obsidian" ];
      ignore_lsp = [ "null-ls" "dockerls" ];
      show_hidden = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd> Telescope projects <cr>";
      options.desc = "Find projects";
    }
    {
      mode = "n";
      key = "<leader><leader>";
      action = "<cmd> Telescope projects <cr>";
      options.desc = "Find projects";
    }
  ];

}
