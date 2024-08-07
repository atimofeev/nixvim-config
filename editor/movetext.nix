{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [{ plugin = vim-move; }];

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
      mode = "i";
      key = "<M-j>";
      action = "<cmd> m +1 <cr>";
      options.desc = "Move line down";
    }
    {
      mode = "i";
      key = "<M-k>";
      action = "<cmd> m -2 <cr>";
      options.desc = "Move line up";
    }
    {
      mode = "v";
      key = "<M-h>";
      action = "<gv";
      options.desc = "Move block left";
    }
    {
      mode = "v";
      key = "<M-l>";
      action = ">gv";
      options.desc = "Move block right";
    }
    # Move blocks vertically
    # vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
    # vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
  ];
}
