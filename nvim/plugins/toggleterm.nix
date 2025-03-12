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

  # # integration with Telescope
  # extraPlugins = let
  #   telescope-toggleterm = pkgs.vimUtils.buildVimPlugin {
  #     name = "telescope-toggleterm.nvim";
  #     src = pkgs.fetchFromSourcehut {
  #       owner = "~havi";
  #       repo = "telescope-toggleterm.nvim";
  #       rev = "5c1402507f0ad01711196e5d27e9f0606f78b7d0";
  #       hash = "sha256-3LbOrix1sTadZh7z5wtwuNKsllqyl3IVhArWdwBCdhM=";
  #     };
  #   };
  # in [{ plugin = telescope-toggleterm; }];
  #
  # extraConfigLua = # lua
  #   ''
  #     require("telescope").load_extension("toggleterm")
  #
  #     vim.keymap.set('n','<leader>fT','<Cmd>Telescope toggleterm<CR>',{noremap = true, silent = true, desc = 'Find terminals'})
  #     vim.keymap.set('n','<leader>v','<Cmd>ToggleTerm direction=vertical<CR>',{noremap = true, silent = true, desc = 'Terminal vertical'})
  #     vim.keymap.set('n','<leader>s','<Cmd>ToggleTerm direction=horizontal<CR>',{noremap = true, silent = true, desc = 'Terminal horizontal'})
  #     vim.keymap.set('n','<leader>tt','<Cmd>ToggleTerm direction=tab<CR>',{noremap = true, silent = true, desc = 'Terminal tab'})
  #   '';

}
