{
  config,
  lib,
  pkgs,
  ...
}:
let
  neojj = pkgs.vimUtils.buildVimPlugin {
    pname = "neojj";
    version = "1.3.0";
    src = pkgs.fetchFromGitHub {
      owner = "NicholasZolton";
      repo = "neojj";
      rev = "4e24d67ba032710c3a2d198fa7336760f28ed418";
      hash = "sha256-uBQwoEGms7H+nWumK/UMO0lsRbYFLftx9yTWKzdrDO0=";
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
