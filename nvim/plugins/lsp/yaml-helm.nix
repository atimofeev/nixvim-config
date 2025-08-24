{ pkgs, ... }:
{

  # TODO: integrate common devops schemes
  # setup https://github.com/b0o/SchemaStore.nvim
  # setup https://github.com/someone-stole-my-name/yaml-companion.nvim
  # or maybe strip-out auto-detect feature?
  # or wait for https://github.com/nix-community/nixvim/issues/3328
  # use these configs
  # https://github.com/steeef/dotfiles/pull/5/files
  # https://github.com/LazyVim/LazyVim/discussions/185
  # OR use this one https://github.com/cwrau/yaml-schema-detect.nvim

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
        settings = {
          yaml = {
            schemaStore = {
              enable = false;
              url = "";
            };
            schemas.__raw = # lua
              ''
                require("schemastore").yaml.schemas {
                  -- extra = {
                  --   {
                  --     description = 'My custom JSON schema',
                  --     fileMatch = 'foo.json',
                  --     name = 'foo.json',
                  --     url = 'https://example.com/schema/foo.json',
                  --   },
                  --   {
                  --     description = 'My other custom JSON schema',
                  --     fileMatch = { 'bar.json', '.baar.json' },
                  --     name = 'bar.json',
                  --     url = 'https://example.com/schema/bar.json',
                  --   },
                  -- },
                }
              '';
          };

        };
      };
    };

    schemastore = {
      enable = true;
      json.enable = false;
      yaml.enable = true;
    };

  };

  # NOTE: To ensure that `helm_ls` (and not `yamlls`) is used on helm files
  autoCmd = [
    {
      event = "FileType";
      pattern = "helm";
      command = "LspRestart";
    }
  ];

  extraPlugins = [

    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "yaml-companion.nvim";
    #   dependencies = with pkgs.vimPlugins; [ plenary-nvim telescope-nvim ];
    #   src = pkgs.fetchFromGitHub {
    #     owner = "someone-stole-my-name";
    #     repo = "yaml-companion.nvim";
    #     rev = "131b0d67bd2e0f1a02e0daf2f3460482221ce3c0";
    #     hash = "sha256-49498W7Hadju54Vi9oOnlNouujhnS8hLQ7ji/3cvIZg=";
    #   };
    # })

    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "yaml-schema-detect.nvim";
    #   dependencies = [ pkgs.vimPlugins.plenary-nvim ];
    #   src = pkgs.fetchFromGitHub {
    #     owner = "cwrau";
    #     repo = "yaml-schema-detect.nvim";
    #     rev = "18b40548cb9a8c70e0d35c362e5f7150d6baef12";
    #     hash = "sha256-6Nc4tc6gndrOKY84LY/32qSGG4hseOsRGWKZgNCUzc8=";
    #   };
    # })
  ];

  # extraConfigLuaPost = # lua
  #   ''
  #     local cfg = require("yaml-companion").setup(opts)
  #     require("lspconfig")["yamlls"].setup(cfg)
  #     require("telescope").load_extension("yaml_schema")'';

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

}
