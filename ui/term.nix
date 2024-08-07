{ pkgs, ... }: {
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts.border = "curved";
      open_mapping = "[[<c-\\>]]";
      size = # lua
        ''
          function(term)
            if term.direction == "horizontal" then
              return 20
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.4
            end
          end
        '';
    };
  };

  # integration with Telescope
  extraPlugins = let
    telescope-toggleterm = pkgs.vimUtils.buildVimPlugin {
      name = "telescope-toggleterm.nvim";
      src = pkgs.fetchFromSourcehut {
        owner = "~havi";
        repo = "telescope-toggleterm.nvim";
        rev = "5c1402507f0ad01711196e5d27e9f0606f78b7d0";
        hash = "sha256-3LbOrix1sTadZh7z5wtwuNKsllqyl3IVhArWdwBCdhM=";
      };
    };
  in [{ plugin = telescope-toggleterm; }];
  extraConfigLua = ''require("telescope").load_extension("toggleterm")'';

  keymaps = [
    {
      mode = "t";
      key = "jk";
      action = "<C-\\><C-N>";
      options.desc = "Escape terminal mode";
    }
    {
      mode = "n";
      key = "<leader>v";
      action = "<cmd> ToggleTerm direction=vertical <cr>";
      options.desc = "Terminal vertical";
    }
    {
      mode = "n";
      key = "<leader>s";
      action = "<cmd> ToggleTerm direction=horizontal <cr>";
      options.desc = "Terminal horizontal";
    }
    {
      mode = "n";
      key = "<leader>B";
      action = "<cmd> enew | setlocal nonumber norelativenumber | term <cr>i";
      options.desc = "Terminal buffer";
    }
    {
      mode = "n";
      key = "<C-w>S";
      action = "<cmd> 20new | setlocal nonumber norelativenumber | term <cr>i";
      options.desc = "Terminal split";
    }
    {
      mode = "n";
      key = "<C-w>V";
      action = "<cmd> 80vnew | setlocal nonumber norelativenumber | term <cr>i";
      options.desc = "Terminal vsplit";
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd> ToggleTerm direction=tab <cr>";
      options.desc = "Terminal tab";
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd> TermExec cmd=htop name=htop direction=float <cr>";
      options.desc = "Terminal htop";
    }

    # integration with Telescope
    {
      mode = "n";
      key = "<leader>fT";
      action = "<cmd> Telescope toggleterm <cr>";
      options.desc = "Find terminals";
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
    # interference with <C-l> for `clear`
    # {
    #   mode = "t";
    #   key = "<C-l>";
    #   action = "<cmd> wincmd l <cr>";
    #   options.desc = "Window right";
    # }
  ];

}
