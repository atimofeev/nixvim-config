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
      ".*/templates/.*%.ya?ml.j2" = "yaml.ansible";
      ".*/.github/workflows/.*%.ya?ml" = "yaml.gh_actions";
      ".*%.conf" = "conf";
      ".*%.conf.j2" = "conf";
      ".*%.service" = "conf";
      ".*%.service.j2" = "conf";
    };

  };

  plugins = {

    todo-comments = {
      enable = true;
      keywords.NOTE.icon = "";
    };

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

    # TODO: setup keymaps for actions
    treesitter-refactor.enable = true;

    treesitter = {
      enable = true;
      indent = true;
      nixvimInjections = true;
      languageRegister = {
        hcl = [ "terraform-vars" ];
        bash = [ "conf" ];
      };
      ensureInstalled = [ # FIX: not working?
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

  };
}
