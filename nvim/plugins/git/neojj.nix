{
  config,
  lib,
  pkgs,
  ...
}:
let
  neojj = pkgs.vimUtils.buildVimPlugin {
    pname = "neojj";
    version = "1.5.0";
    src = pkgs.fetchFromGitHub {
      owner = "NicholasZolton";
      repo = "neojj";
      rev = "v1.6.0";
      hash = "sha256-89A0JZ/dzyaTTUF4eS7j1/c7Cq+UcyuQf7yEA28M2k4=";
    };
    dependencies = with pkgs.vimPlugins; [ plenary-nvim ];
    nvimSkipModules = [ "neojj.integrations.diffview" ];
  };
in
{

  extraPackages = with pkgs; [ jujutsu ];

  extraPlugins = [ { plugin = neojj; } ];

  extraConfigLua = # lua
    ''
      require("neojj").setup {
        disable_hint = true,
        disable_signs = true,
        graph_style = "ascii",
        show_project_header = false,
        sections = {
          recent = { folded = false },
          bookmarks = { folded = true }
        },
        integrations = {
          codediff = ${lib.boolToString config.plugins.codediff.enable},
          diffview = ${lib.boolToString config.plugins.diffview.enable},
          fzf_lua = ${lib.boolToString config.plugins.fzf-lua.enable},
          mini_pick = ${lib.boolToString config.plugins.mini-pick.enable},
          snacks = ${lib.boolToString config.plugins.snacks.enable},
          telescope = ${lib.boolToString config.plugins.telescope.enable},
        },
      }

      map("n", "<leader>j", "<Cmd>Neojj<CR>", { desc = "Open Neojj" })
    '';

}
