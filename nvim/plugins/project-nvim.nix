_: {

  plugins.project-nvim = {
    enable = true;
    settings = {
      detection_methods = [ "pattern" ];
      # ignore_lsp = [ "null-ls" "dockerls" "terraformls" "helm_ls" ];
      manual_mode = false;
      patterns =
        [ ".git" ".obsidian" ".terraform" ".terraform.lock.hcl" "Chart.yaml" ];
      scope_chdir = "global";
      show_hidden = true;
      silent_chdir = true;
    };
  };

  extraConfigLua = # lua
    ''
      require('telescope').load_extension('projects')

      vim.keymap.set('n','<leader>fp','<Cmd>Telescope projects<CR>',{noremap = true, silent = true, desc = 'Find projects'})
      vim.keymap.set('n','<leader><leader>','<Cmd>Telescope projects<CR>',{noremap = true, silent = true, desc = 'Find projects'})
    '';

}
