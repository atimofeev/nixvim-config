_: {

  plugins.barbar.enable = true;

  keymaps = [
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
  ];
}
