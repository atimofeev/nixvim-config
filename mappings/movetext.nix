{ ... }: {
  keymaps = [
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Indent lines";
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Indent lines";
    }
    {
      mode = [ "n" "i" ];
      key = "<M-j>";
      action = "<cmd> m +1 <cr>";
      options.desc = "Move line down";
    }
    {
      mode = [ "n" "i" ];
      key = "<M-k>";
      action = "<cmd> m -2 <cr>";
      options.desc = "Move line up";
    }
    # Move blocks vertically
    # vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
    # vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
  ];
}
