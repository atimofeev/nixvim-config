{ ... }: {
  # TODO: Terraform package version pin
  # TODO: https://github.com/nvimtools/none-ls.nvim/issues/58
  plugins.lsp-format.enable = true;

  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {

      diagnostics = {
        statix.enable = true; # nix
        # luacheck.enable = true; # lua; dropped as unmaintained
        mypy.enable = true; # python
        # ruff.enable = true; # dropped as unmaintained
        golangci_lint.enable = true; # go
        # shellcheck.enable = true; # shell; dropped as unmaintained
        fish.enable = true;
        hadolint.enable = true; # docker
        # TODO: add tflint to none-ls
        # tflint.enable = true; # terraform
        terraform_validate.enable = true;
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
        # jsonlint.enable = true; # dropped as unmaintained
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
            {extra_args = {"--column_width", "120", "--indent_type", "Spaces", "--indent_width", "2", "--quote_style", "AutoPreferDouble", "--call_parentheses", "None"},}
          '';
        };
        black.enable = true; # python
        gofumpt.enable = true; # go
        golines.enable = true;
        shfmt.enable = true; # shell
        fish_indent.enable = true;
        terraform_fmt.enable = true; # terraform
        # yaml, json
        # FIX: https://github.com/NixOS/nixpkgs/issues/294005
        # yamlfix = { 
        #   enable = true;
        #   withArgs = ''
        #     {env = {
        #       YAMLFIX_COMMENTS_MIN_SPACES_FROM_CONTENT = "2", 
        #       YAMLFIX_COMMENTS_REQUIRE_STARTING_SPACE="true",
        #       YAMLFIX_WHITELINES="1",
        #       YAMLFIX_SECTION_WHITELINES="1", 
        #       YAMLFIX_SEQUENCE_STYLE="keep_style",
        #       YAMLFIX_quote_representation='"', -- not working
        #       YAMLFIX_preserve_quotes="true",
        #       YAMLFIX_LINE_LENGTH="999", -- disable line wrap
        #     },}
        #   '';
        # };

        # fixjson.enable = true; # dropped as unmaintained
        # markdown, etc
        prettier = {
          enable = true;
          withArgs = ''{ filetypes = {"json", "markdown"},}'';
        };
      };
    };
  };
}
# local config_path = vim.fn.expand "~/.config/nvim/lua/custom/configs/lint-fmt/"
# -- Builtin sources list: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
