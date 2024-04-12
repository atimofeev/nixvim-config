{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [{ plugin = nvim-spectre; }];
  keymaps = [{
    mode = "n";
    key = "<leader>S";
    action = "<cmd> lua require('spectre').toggle() <cr>";
    options.desc = "Spectre";
  }
  # {
  #   mode = "n";
  #   key = "<leader>sw";
  #   action = "<cmd>lua require('spectre').open_visual({select_word=true})<cr>";
  #   options.desc = "Search current word";
  # }
  # {
  #   mode = "v";
  #   key = "<leader>sw";
  #   action = "<esc><cmd>lua require('spectre').open_visual()<CR>";
  #   options.desc = "Search current word";
  # }
  # {
  #   mode = "n";
  #   key = "<leader>sp";
  #   action = "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>";
  #   options.desc = "Search on current file";
  # }
    ];
}
