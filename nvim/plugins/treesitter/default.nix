{

  imports = [
    # ./nushell.nix
    ./rainbow-delimiters.nix
    ./textobjects.nix
  ];

  plugins = {

    treesitter-refactor.enable = true;

    treesitter = {
      enable = true;
      # indent = true;
      nixvimInjections = true;
      languageRegister = {
        hcl = [ "terraform-vars" ];
        bash = [ "conf" ];
      };

      settings = {

        highlight.enable = true;

        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            node_decremental = "<bs>";
          };
        };

        ensure_installed = [
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
          "helm"
          "html"
          "ini"
          "json"
          "latex"
          "lua"
          "make"
          "markdown"
          "markdown_inline"
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
  };

}
