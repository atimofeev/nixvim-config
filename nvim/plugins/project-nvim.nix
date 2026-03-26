{

  plugins.project-nvim = {
    enable = true;
    settings = {
      historysize = 0;
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
