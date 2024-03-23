{ pkgs-stable, ... }: {
  # TODO: https://github.com/nvimtools/none-ls.nvim/issues/58
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
        # TODO: add tflint to none-ls
        # tflint.enable = true; # terraform
        terraform_validate = {
          enable = true;
          package = null; # NOTE: use host terraform version
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
            true; # ignore line-length, no-inline-html, no-bare-urls, first-line-heading
          withArgs = ''
            {extra_args = {"--disable", "MD013", "MD033", "MD034", "MD041"},}
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
          package = null; # NOTE: use host terraform version
        };
        # yaml, json
        yamlfix = {
          enable = true;
          # FIX: nixpkgs-unstable https://github.com/NixOS/nixpkgs/issues/294005
          # OR
          # FIX: implement second pkgs channel
          # https://discord.com/channels/568306982717751326/1061656643189878874/threads/1219035364337909891
          # https://github.com/hercules-ci/flake-parts/discussions/217
          # package = pkgs-stable.yamlfix;
          package = null; # HACK: using host yamlfix-23.11 package
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
