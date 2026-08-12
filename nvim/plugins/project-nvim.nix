{

  plugins.project-nvim = {
    enable = true;
    lazyLoad.settings.event = "VimEnter";
    settings = {
      history = {
        save_dir.__raw = ''
          (function()
            local dir = vim.fn.tempname()
            vim.fn.mkdir(dir, "p")
            return dir
          end)()
        '';
        size = 1;
      };
      lsp = {
        enabled = false;
        use_pattern_matching = true;
      };
      manual_mode = false;
      patterns = [
        ".git"
        ".obsidian"
        ".terraform"
        ".terraform.lock.hcl"
        "Chart.yaml"
      ];
      scope_chdir = "global";
      show_hidden = true;
      silent_chdir = true;
    };
  };

}
