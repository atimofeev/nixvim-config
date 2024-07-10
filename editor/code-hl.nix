{ pkgs, ... }: {
  filetype = {

    filename = {
      "Jenkinsfile" = "groovy";
      "flake.lock" = "json";
    };

    pattern = {
      "docker-compose.ya?ml" = "yaml.docker-compose";
      ".*/.github/workflows/.*%.ya?ml" = "yaml.gh_actions";

      # ansible
      "playbook.ya?ml" = "yaml.ansible";
      ".*/playbooks/.*%.ya?ml" = "yaml.ansible";
      ".*/roles/.*%.ya?ml" = "yaml.ansible";
      ".*/group_vars/.*" = "yaml.ansible";
      ".*/host_vars/.*" = "yaml.ansible";

      # conf
      ".*%.cfg" = "conf";
      ".*%.conf" = "conf";
      ".*%.service" = "conf";

      # terraform
      ".*%.tf" = "terraform";
      "terraform.tfstate.*" = "json";
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
      settings.scope.enabled = false;
    };

    rainbow-delimiters = {
      enable = true;
      query = {
        default = "rainbow-delimiters";
        lua = "rainbow-blocks";
      };
    };

    treesitter-refactor.enable = true;

    treesitter = {
      enable = true;
      indent = true;
      nixvimInjections = true;
      languageRegister = {
        hcl = [ "terraform-vars" ];
        bash = [ "conf" ];
      };
      incrementalSelection = {
        enable = true;
        keymaps = {
          initSelection = "<C-space>";
          nodeIncremental = "<C-space>";
          nodeDecremental = "<bs>";
        };
      };
      ensureInstalled = [
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

  extraPlugins = let
    jinja.vim = pkgs.vimUtils.buildVimPlugin {
      name = "jinja.vim";
      src = pkgs.fetchFromGitHub {
        owner = "HiPhish";
        repo = "jinja.vim";
        rev = "51b8a2a504416c4959127c82eac26f14f3508975";
        hash = "sha256-9s0P1JxGZow/MpLorKeuLd2AE91XVow1Ufm3zMw+XZU=";
      };
    };
  in [{ plugin = jinja.vim; }];
  autoCmd = [{
    event = [ "BufEnter" ];
    pattern = [ "*.j2" ];
    command = "TSBufDisable highlight";
  }];
}
