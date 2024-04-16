{ ... }: {
  imports = [ ./motion.nix ./movetext.nix ./treesitter.nix ];
  # TODO: find solution to smartindent and #

  globals.mapleader = " ";

  keymaps = [
    {
      mode = "n";
      key = ";";
      action = ":";
      options.desc = "Command mode";
    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd> noh <cr>";
      options.desc = "Clear highlights";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd> NvimTreeFocus <cr>";
      options.desc = "Focus nvimtree";
    }
    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd> Neogit <cr>";
      options.desc = "Open Neogit";
    }

    # resize windows
    # FIX: static resizing, not based on window position
    {
      mode = [ "n" "t" ];
      key = "<C-Up>";
      action = "<cmd> resize -2 <cr>";
    }
    {
      mode = [ "n" "t" ];
      key = "<C-Down>";
      action = "<cmd> resize +2 <cr>";
    }
    {
      mode = [ "n" "t" ];
      key = "<C-Left>";
      action = "<cmd> vertical resize -2 <cr>";
    }
    {
      mode = [ "n" "t" ];
      key = "<C-Right>";
      action = "<cmd> vertical resize +2 <cr>";
    }
    # x = {
    #   -- Don't copy the replaced text after pasting in visual mode
    #   -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    #   ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
    # },
  ];
}
