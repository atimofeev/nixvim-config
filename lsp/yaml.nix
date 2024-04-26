{ pkgs, ... }: {
  # TODO: kb to show current schema
  # integrate actual k8s schemas: https://github.com/yannh/kubernetes-json-schema
  extraPlugins = with pkgs.vimPlugins;
    let
      yaml-companion = pkgs.vimUtils.buildVimPlugin {
        name = "yaml-companion.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "someone-stole-my-name";
          repo = "yaml-companion.nvim";
          rev = "4de1e1546abc461f62dee02fcac6a02debd6eb9e";
          hash = "sha256-BmX7hyiIMQfcoUl09Y794HrSDq+cj93T+Z5u3e5wqLc=";
        };
      };
    in [{ plugin = yaml-companion; }];
  extraConfigLua = ''
    local cfg = require("yaml-companion").setup(opts)
    require("lspconfig")["yamlls"].setup(cfg)
    require("telescope").load_extension("yaml_schema")'';
}
