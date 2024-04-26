{ ... }: {
  imports = [ ./editor ./lsp ./mappings ./ui ];

  # TODO: buffer refresh on file update
  # https://www.reddit.com/r/neovim/comments/f0qx2y/automatically_reload_file_if_contents_changed/

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
    '';

  };
}
