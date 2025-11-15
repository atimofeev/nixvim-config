{

  plugins.project-nvim = {
    enable = true;
    settings = {
      detection_methods = [ "pattern" ];
      # ignore_lsp = [ "null-ls" "dockerls" "terraformls" "helm_ls" ];
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
