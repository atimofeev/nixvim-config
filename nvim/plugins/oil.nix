_: {

  plugins = {
    oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        delete_to_trash = true;
        skip_confirm_for_simple_edits = true;
        view_options = {
          show_hidden = true;
          natural_order = true;
          is_always_hidden = # lua
            ''
              function(name, _)
                return name == '..' or name == '.git' or name == '.mypy_cache' or name == '.null-ls_.*'
              end
            '';
        };
        win_options = { wrap = true; };
        keymaps = {
          "<BS>" = "actions.parent";
          "<C-p>" = "actions.preview";
          "<C-r>" = "actions.refresh";
          "<CR>" = "actions.select";
          "<g.>" = "actions.toggle_hidden";
          "<g?>" = "actions.show_help";
          "`" = "actions.cd";
        };
        use_default_keymaps = false;
      };
    };
  };

  extraConfigLua = # lua
    ''
      vim.keymap.set('n','<leader>o','<Cmd>Oil<CR>',{noremap = true, silent = true, desc = 'Open Oil'})
    '';

}
