{ ... }: {
  plugins.telescope = {
    enable = true;
    extensions.project-nvim.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd> Telescope find_files <cr>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>fa";
      action =
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>";
      options.desc = "Find all files";
    }
    {
      mode = "n";
      key = "<leader>fw";
      action = "<cmd> Telescope live_grep <cr>";
      options.desc = "Find word";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd> Telescope buffers <cr>";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd> Telescope help_tags <cr>";
      options.desc = "Find help";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd> Telescope oldfiles <cr>";
      options.desc = "Find recent";
    }
    {
      mode = "n";
      key = "<leader>fz";
      action = "<cmd> Telescope current_buffer_fuzzy_find <cr>";
      options.desc = "Find word (buffer)";
    }
    {
      mode = "n";
      key = "<leader>fgc";
      action = "<cmd> Telescope git_commits <cr>";
      options.desc = "Find git commits";
    }
    {
      mode = "n";
      key = "<leader>fgs";
      action = "<cmd> Telescope git_status <cr>";
      options.desc = "Find git status";
    }
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
