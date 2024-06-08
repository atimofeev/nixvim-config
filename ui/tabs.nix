_: {

  plugins.barbar = {
    enable = true;
    settings.exclude_ft = [ "NeogitStatus" ];
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd> enew <cr>";
      options.desc = "New buffer";
    }
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd> confirm BufferClose <cr>";
      options.desc = "Close buffer";
    }
    {
      mode = "n";
      key = "<tab>";
      action = "<cmd> BufferNext <cr>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<S-tab>";
      action = "<cmd> BufferPrevious <cr>";
      options.desc = "Previous buffer";
    }
    {
      mode = "n";
      key = "<leader>Tp";
      action = "<cmd> BufferPin <cr>";
      options.desc = "Tab pin toggle";
    }
    {
      mode = "n";
      key = "<leader>Ts";
      action = "<cmd> BufferPick <cr>";
      options.desc = "Tab select";
    }
  ];

}
