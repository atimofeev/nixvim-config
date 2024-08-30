_: {

  imports = [ ./rainbow-delimiters.nix ./textobjects.nix ];

  plugins = {

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

}
