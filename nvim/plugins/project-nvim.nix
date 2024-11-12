_: {

  plugins.project-nvim = {
    enable = true;
    settings = {
      patterns = [ ".git" ".obsidian" ".terraform" ".terraform.lock.hcl" ];
      ignore_lsp = [ "null-ls" "dockerls" "terraformls" "helm_ls" ];
      show_hidden = true;
    };
  };

  extraConfigLua = # lua
    ''
      require('telescope').load_extension('projects')

      vim.keymap.set('n','<leader>fp','<Cmd>Telescope projects<CR>',{noremap = true, silent = true, desc = 'Find projects'})
      vim.keymap.set('n','<leader><leader>','<Cmd>Telescope projects<CR>',{noremap = true, silent = true, desc = 'Find projects'})
    '';

}
