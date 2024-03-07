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
    # FIX: breaks most interactions with #
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

    # TODO: complete nvchad keymaps adaptation

    # -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    # -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    # -- empty mode is same as using <cmd> :map
    # -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    # ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    # ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    # ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    # ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

    # t = {
    #   ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    # },
    #
    # v = {
    #   ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    #   ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    #   ["<"] = { "<gv", "Indent line" },
    #   [">"] = { ">gv", "Indent line" },
    # },
    #
    # x = {
    #   ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    #   ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    #   -- Don't copy the replaced text after pasting in visual mode
    #   -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    #   ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
    # },
  ];
}
