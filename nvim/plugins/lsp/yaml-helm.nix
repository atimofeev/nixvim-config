{ pkgs, ... }: {

  plugins = {
    helm.enable = true;
    lsp.servers = {
      helm_ls = {
        enable = true;
        filetypes = [ "helm" ];
        # settings = {
        #   yamlls.path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
        # };
      };
      yamlls = {
        enable = true;
        filetypes = [ "yaml" ];
      };
    };
  };

  # NOTE: To ensure that `helm_ls` (and not `yamlls`) is used on helm files
  autoCmd = [{
    event = "FileType";
    pattern = "helm";
    command = "LspRestart";
  }];

  # extraPlugins = let
  #   yaml-companion = pkgs.vimUtils.buildVimPlugin {
  #     name = "yaml-companion.nvim";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "someone-stole-my-name";
  #       repo = "yaml-companion.nvim";
  #       rev = "131b0d67bd2e0f1a02e0daf2f3460482221ce3c0";
  #       hash = "sha256-49498W7Hadju54Vi9oOnlNouujhnS8hLQ7ji/3cvIZg=";
  #     };
  #   };
  # in [{ plugin = yaml-companion; }];
  #
  # extraConfigLuaPost = # lua
  #   ''
  #     local cfg = require("yaml-companion").setup(opts)
  #     require("lspconfig")["yamlls"].setup(cfg)
  #     require("telescope").load_extension("yaml_schema")'';

}
