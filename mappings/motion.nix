{ ... }: {

  extraConfigLua = ''
    -- go to previous/next line with h,l,left arrow and right arrow
    -- when cursor reaches end/beginning of line
    vim.opt.whichwrap:append "<>[]hl";
  '';

  keymaps = [
    # Disable arrow keys
    {
      mode = [ "n" "i" ];
      key = "<Up>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Up arrow key";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<Down>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Down arrow key";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<Right>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Right arrow key";
      };
    }
    {
      mode = [ "n" "i" ];
      key = "<Left>";
      action = "<Nop>";
      options = {
        silent = true;
        noremap = true;
        desc = "Disable Left arrow key";
      };
    }

    # navigate within insert mode
    {
      mode = "i";
      key = "<C-h>";
      action = "<Left>";
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "<Down>";
    }
    {
      mode = "i";
      key = "<C-k>";
      action = "<Up>";
    }
    {
      mode = "i";
      key = "<C-l>";
      action = "<Right>";
    }

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
  ];
}
