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
                return name == '..' or name == '.git'
              end
            '';
        };
        win_options = { wrap = true; };
        keymaps = { "<BS>" = "actions.parent"; };
      };
    };
  };

  keymaps = [{
    mode = "n";
    key = "<leader>o";
    action = "<cmd> Oil <cr>";
    options.desc = "Open Oil";
  }];

}
