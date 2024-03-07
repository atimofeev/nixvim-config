{ pkgs, ... }: {
  imports = [ ./editor ./lsp ./mappings ./ui ];

  config = {
    clipboard.register = "unnamedplus";

    options = {

      # indenting
      shiftwidth = 2;
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      smartindent = true;

      fillchars = { eob = " "; };
      ignorecase = true;
      smartcase = true;
      mouse = "a";

      # numbers
      number = true;
      relativenumber = true;
      numberwidth = 2;
      cursorline = true;
      ruler = false;

      # disable nvim intro
      # shortmess:append "sI";

      signcolumn = "yes";
      splitbelow = true;
      splitright = true;
      termguicolors = true;
      timeoutlen = 400;
      undofile = true;

      updatetime = 250;

      # go to previous/next line with h,l,left arrow and right arrow
      # when cursor reaches end/beginning of line
      # opt.whichwrap:append "<>[]hl"

    };

    # extraPlugins = with pkgs.vimPlugins; [{
    #   plugin = comment-nvim;
    #   config = ''lua require("Comment").setup()'';
    # }];
  };

  # autoCmd = [{
  #   event = [ "BufEnter" "BufWinEnter" ];
  #   pattern = [ "*.c" "*.h" ];
  #   command = "echo 'Entering a C/C++ file'";
  # }];

  # highlight = {
  #   Comment.fg = "#ff00ff";
  #   Comment.bg = "#000000";
  #   Comment.underline = true;
  #   Comment.bold = true;
  # };
}
