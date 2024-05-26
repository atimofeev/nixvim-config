_: {

  extraConfigLua = ''
    -- go to previous/next line with h,l,left arrow and right arrow
    -- when cursor reaches end/beginning of line
    vim.opt.whichwrap:append "<>[]hl";
  '';

  keymaps = [
    # navigate windows
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Window left";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Window down";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Window up";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Window right";
    }

    # naviagte windows in terminal mode
    {
      mode = "t";
      key = "<C-h>";
      action = "<cmd> wincmd h <cr>";
      options.desc = "Window left";
    }
    {
      mode = "t";
      key = "<C-j>";
      action = "<cmd> wincmd j <cr>";
      options.desc = "Window down";
    }
    {
      mode = "t";
      key = "<C-k>";
      action = "<cmd> wincmd k <cr>";
      options.desc = "Window up";
    }
    {
      mode = "t";
      key = "<C-l>";
      action = "<cmd> wincmd l <cr>";
      options.desc = "Window right";
    }

    # go through wrapped lines
    {
      mode = [ "n" "v" ];
      key = "j";
      action = "gj";
    }
    {
      mode = [ "n" "v" ];
      key = "k";
      action = "gk";
    }
  ];
}
