{ pkgs, lib, ... }:
{

  extraPackages = with pkgs; [
    actionlint
    deadnix
    golangci-lint
    hadolint
    markdownlint-cli
    mypy
    shellcheck
    statix
    tflint
    tfsec
    yamllint
  ];

  env = {
    YAMLLINT_CONFIG_FILE =
      pkgs.writeText "yamllint-config.yaml" # yaml
        ''
          extends: default
          rules:
            line-length: disable
        '';
  };

  plugins.lint = {
    enable = true;

    lintersByFt = {
      "yaml.gh_actions" = [ "actionlint" ];
      bash = [ "shellcheck" ];
      docker = [ "hadolint" ];
      fish = [ "fish" ];
      go = [ "golangcilint" ];
      markdown = [ "markdownlint" ];
      nix = [
        "deadnix"
        "statix"
      ];
      python = [ "mypy" ];
      terraform = [
        "terraform_validate"
        "tflint"
        "tfsec"
      ];
      yaml = [ "yamllint" ];
    };

    linters = {
      markdownlint.args = [
        "--stdin"
        "--disable"
        "MD012"
        "MD013"
        "MD024"
        "MD033"
        "MD034"
        "MD041"
      ];

      # FIX: https://github.com/mfussenegger/nvim-lint/issues/792
      # terraform_validate.cmd = lib.getExe pkgs.opentofu;

    };

  };

  extraConfigLua = # lua
    ''
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        desc = "Run linters",
        callback = function()
          require("lint").try_lint()
        end,
      })

      -- HACK: workaround for issue above
      local original_tf_validate_func = require("lint").linters.terraform_validate
      require("lint").linters.terraform_validate = function()
        local linter_config = original_tf_validate_func()
        linter_config.cmd = "${lib.getExe pkgs.opentofu}"
        return linter_config
      end
    '';

}
