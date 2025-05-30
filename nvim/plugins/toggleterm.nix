{

  plugins.toggleterm = {
    enable = true;
    settings = {
      autochdir = true;
      direction = "float";
      float_opts.border = "curved";
      open_mapping = "[[<c-\\>]]";
      size.__raw = ''
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

  extraConfigLua = ''
    vim.keymap.set(
      "n",
      "<leader>v",
      "<Cmd>ToggleTerm direction=vertical<CR>",
      { noremap = true, silent = true, desc = "Terminal vertical" }
    )
    vim.keymap.set(
      "n",
      "<leader>s",
      "<Cmd>ToggleTerm direction=horizontal<CR>",
      { noremap = true, silent = true, desc = "Terminal horizontal" }
    )
  '';

}
