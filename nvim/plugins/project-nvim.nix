_: {

  plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
    showHidden = true;
    patterns = [ ".git" ];
    ignoreLsp = [ "null-ls" "dockerls" ];
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
