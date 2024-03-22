{ ... }: {
  imports = [ ./motion.nix ];

  globals.mapleader = " ";

  keymaps = [
    {
      mode = "n";
      key = ";";
      action = ":";
      options.desc = "Command mode";
    }
    # FIX: trying to avoid indent reset with '#'
    # breaks most interactions with #
    # {
    #   mode = "i";
    #   key = "#";
    #   action = "X<C-h>#<space>";
    #   options.desc = "Fix # with smartindent";
    # }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Indent lines";
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Indent lines";
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
    {
      mode = [ "n" "i" ];
      key = "<M-j>";
      action = "<cmd> m +1 <cr>";
      options.desc = "Move line down";
    }
    {
      mode = [ "n" "i" ];
      key = "<M-k>";
      action = "<cmd> m -2 <cr>";
      options.desc = "Move line up";
    }

    #
    # x = {
    #   -- Don't copy the replaced text after pasting in visual mode
    #   -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    #   ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
    # },
  ];
}
