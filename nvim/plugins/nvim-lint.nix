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

    };

  };

  extraConfigLua = # lua
    ''
      local slow_linters = { "terraform_validate" } -- do not run these on BufEnter

      local function get_linters_for_event(event)
        if event == "BufEnter" then
          local all = require("lint").linters_by_ft[vim.bo.filetype] or {}
          return vim.tbl_filter(function(l)
            return not vim.tbl_contains(slow_linters, l)
          end, all)
        end
        return nil
      end

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        desc = "Run linters",
        callback = function(ev)
          local linters = get_linters_for_event(ev.event)
          require("lint").try_lint(linters)
        end,
      })

      -- NOTE: overrides terraform_validate.cmd
      local original_tf_validate_func = require("lint").linters.terraform_validate
      require("lint").linters.terraform_validate = function()
        local linter_config = original_tf_validate_func()
        linter_config.cmd = "${lib.getExe pkgs.opentofu}"
        return linter_config
      end
    '';

}
