_: {
  plugins.lsp-format.enable = true;

  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {

      diagnostics = {
        statix.enable = true; # nix
        mypy.enable = true; # python
        golangci_lint.enable = true; # go
        fish.enable = true;
        hadolint.enable = true; # docker
        terraform_validate = {
          enable = true;
          package = null; # NOTE: use host tofu executable
          withArgs = ''{command = "tofu"}'';
        };
        tfsec.enable = true;
        # yaml
        actionlint = {
          enable = true;
          withArgs = ''{filetypes = {"yaml.gh_actions"},}'';
        };
        ansiblelint.enable = true;
        yamllint = {
          enable = true;
          withArgs = ''
            {extra_args = {"-d", "{extends: default, rules: {line-length: disable}}"},}'';
        };
        # markdown, etc
        markdownlint = {
          enable =
            true; # ignore no-multiple-blanks, line-length, no-inline-html, no-bare-urls, first-line-heading
          withArgs = ''
            {extra_args = {"--disable", "MD012", "MD013", "MD033", "MD034", "MD041"},}
          '';
        };
      };

      formatting = {
        nixfmt.enable = true; # nix
        # lua
        stylua = {
          enable = true;
          withArgs = ''
            {extra_args = {
                "--column_width", "120", 
                "--indent_type", "Spaces", 
                "--indent_width", "2", 
                "--quote_style", "AutoPreferDouble", 
                "--call_parentheses", "None"
              },}
          '';
        };
        black.enable = true; # python
        gofumpt.enable = true; # go
        golines.enable = true;
        shfmt.enable = true; # shell
        fish_indent.enable = true;
        terraform_fmt = { # terraform
          enable = true;
          package = null; # NOTE: use host tofu executable
          withArgs = ''{command = "tofu"}'';
        };
        # yaml, json
        yamlfix = {
          enable = true;
          # package = pkgs-stable.yamlfix;
          package = null; # NOTE: using host yamlfix-23.11 package
          withArgs = ''
            {env = {
              YAMLFIX_COMMENTS_MIN_SPACES_FROM_CONTENT = "2", 
              YAMLFIX_COMMENTS_REQUIRE_STARTING_SPACE="true",
              YAMLFIX_WHITELINES="1",
              YAMLFIX_SECTION_WHITELINES="1", 
              YAMLFIX_SEQUENCE_STYLE="keep_style",
              YAMLFIX_quote_representation='"', -- not working
              YAMLFIX_preserve_quotes="true",
              YAMLFIX_LINE_LENGTH="999", -- disable line wrap
            },}
          '';
        };
        # markdown, etc
        prettier = {
          enable = true;
          withArgs = ''{ filetypes = {"json", "markdown"},}'';
        };
      };
    };
  };
}
