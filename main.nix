_: {
  imports = [ ./editor ./lsp ./ui ];

  config = {

    clipboard.register = "unnamedplus";

    opts = {

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

    extraConfigLua = # lua
      ''
        -- disable nvim intro
        vim.opt.shortmess:append "sI";
      '';

  };
}
