_: {

  globals.mapleader = " ";

  keymaps = [
    {
      mode = "n";
      key = ";";
      action = ":";
      options.desc = "Command mode";
    }
    {
      mode = "n";
      key = ":";
      action = ";";
      options.desc = "Next symbol match";
    }
    {
      mode = "x";
      key = "p";
      action = "P";
      options.desc = "Paste without copy";
    }
    {
      mode = "x";
      key = "P";
      action = "p";
      options.desc = "Paste and copy replaced text";
    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd> noh <cr>";
      options.desc = "Clear highlights";
    }

    # resize windows
    {
      mode = [ "n" ];
      key = "<C-Up>";
      action = "<cmd> resize -2 <cr>";
    }
    {
      mode = [ "n" ];
      key = "<C-Down>";
      action = "<cmd> resize +2 <cr>";
    }
    {
      mode = [ "n" ];
      key = "<C-Left>";
      action = "<cmd> vertical resize -2 <cr>";
    }
    {
      mode = [ "n" ];
      key = "<C-Right>";
      action = "<cmd> vertical resize +2 <cr>";
    }
  ];
}
