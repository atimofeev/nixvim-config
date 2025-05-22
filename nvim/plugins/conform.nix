{ pkgs, lib, ... }:
{

  extraConfigLuaPre = ''
    vim.g.autoformat = true
  '';

  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        "*" = [ "injected" ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
        bash = [ "shfmt" ];
        go = [
          "gofumpt"
          "golines"
        ];
        json = [ "prettier" ];
        lua = [ "stylua" ];
        markdown = [ "prettier" ];
        nix = [ "nixfmt" ];
        python = [
          "isort"
          "black"
        ];
        terraform = [ "tofu_fmt" ];
        yaml = [ "yamlfix" ];
      };
      format_on_save.__raw = ''
        function(bufnr)
          if vim.g.autoformat or vim.b[bufnr].autoformat then
            return { lsp_format = "fallback" }
          end
        end
      '';
      log_level = "warn";
      # notify_on_error = false;
      notify_no_formatters = false;
      formatters = {
        black.command = lib.getExe pkgs.black;
        fish_indent.command = lib.getExe pkgs.fish;
        gofumpt.command = lib.getExe pkgs.gofumpt;
        golines.command = lib.getExe pkgs.golines;
        injected.options.lang_to_formatters = {
          yaml = [ "yamlfmt" ];
        };
        isort.command = lib.getExe pkgs.isort;
        nixfmt = {
          command = lib.getExe pkgs.nixfmt-rfc-style;
          timeout_ms = 1000;
        };
        prettier.command = lib.getExe pkgs.nodePackages.prettier;
        shfmt.command = lib.getExe pkgs.shfmt;
        squeeze_blanks.command = lib.getExe' pkgs.coreutils "cat";
        stylua = {
          command = lib.getExe pkgs.stylua;
          append_args = [
            "--column-width"
            "120"
            "--indent-type"
            "Spaces"
            "--indent-width"
            "2"
            "--quote-style"
            "AutoPreferDouble"
            "--call-parentheses"
            "None"
          ];
        };
        tofu_fmt.command = lib.getExe pkgs.opentofu;
        yamlfmt = {
          command = lib.getExe pkgs.yamlfmt;
          # prepend_args = [
          #   "-conf"
          #   (pkgs.writeText "yamlfmt-config.yaml" ''
          #     continue_on_error: true
          #     formatter:
          #       type: basic
          #       retain_line_breaks: true
          #   '')
          # ];
        };
        yamlfix = {
          command = lib.getExe' pkgs.yamlfix "yamlfix";
          env = {
            YAMLFIX_COMMENTS_REQUIRE_STARTING_SPACE = "true";
            YAMLFIX_WHITELINES = "1";
            YAMLFIX_SECTION_WHITELINES = "1";
            YAMLFIX_SEQUENCE_STYLE = "keep_style";
            # YAMLFIX_quote_representation='"'; -- not working
            YAMLFIX_preserve_quotes = "true";
            YAMLFIX_LINE_LENGTH = "999"; # disable line wrap
          };
        };
      };
    };
  };

}
