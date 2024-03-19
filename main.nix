{ ... }: {
  imports = [ ./editor ./lsp ./mappings ./ui ];

  config = {

    clipboard.register = "unnamedplus";

    options = {

      cursorline = true;

      # indenting
      expandtab = true;
      shiftwidth = 2;
      smartindent = true;
      tabstop = 2;
      softtabstop = 2;

      fillchars.eob = " ";
      ignorecase = true;
      smartcase = true;
      mouse = "a";

      # numbers
      number = true;
      relativenumber = true;
      numberwidth = 2;
      ruler = false;

      signcolumn = "yes";
      splitbelow = true;
      splitright = true;
      termguicolors = true;
      timeoutlen = 400;
      undofile = true;

      updatetime = 250;

    };

    extraConfigLua = ''
      -- disable nvim intro
      vim.opt.shortmess:append "sI";

      -- go to previous/next line with h,l,left arrow and right arrow
      -- when cursor reaches end/beginning of line
      vim.opt.whichwrap:append "<>[]hl";
    '';
  };
}
