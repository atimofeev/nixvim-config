{ ... }: {
  filetype = {

    filename = {
      "Jenkinsfile" = "groovy";
      "playbook.yaml" = "yaml.ansible";
      "playbook.yml" = "yaml.ansible";
      "docker-compose.yaml" = "yaml.docker-compose";
      "docker-compose.yml" = "yaml.docker-compose";
      "flake.lock" = "json";
    };

    pattern = {
      ".*/playbooks/.*%.ya?ml" = "yaml.ansible";
      ".*/roles/.*%.ya?ml" = "yaml.ansible";
      ".*/group_vars/.*" = "yaml.ansible";
      ".*/host_vars/.*" = "yaml.ansible";
      ".*/.github/workflows/.*%.ya?ml" = "yaml.gh_actions";
      ".*%.conf" = "conf";
    };

  };

  plugins = {

    treesitter = {
      enable = true;
      nixvimInjections = true;
      languageRegister.hcl = [ "terraform-vars" ];
      ensureInstalled = [ # not working
        "bash"
        "c"
        "commonlisp"
        "cpp"
        "css"
        "diff"
        "dockerfile"
        "git_config"
        "git_rebase"
        "gitignore"
        "gnuplot"
        "go"
        "groovy"
        "hcl"
        "html"
        "ini"
        "json"
        "latex"
        "lua"
        "make"
        "markdown"
        "markdown_inline"
        "org"
        "python"
        "terraform"
        "toml"
        "vim"
        "vimdoc"
        "xml"
        "yaml"
      ];
    };

    todo-comments.enable = true;

    nvim-colorizer.enable = true;

    indent-blankline = {
      enable = true;
      scope.showStart = false;
    };

    rainbow-delimiters = {
      enable = true;
      query = {
        default = "rainbow-delimiters";
        lua = "rainbow-blocks";
      };
    };

  };
}
