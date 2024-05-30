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
