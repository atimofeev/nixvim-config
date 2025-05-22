{ pkgs, ... }:
{

  extraPlugins =
    let
      gitlinker-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "gitlinker.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "linrongbin16";
          repo = "gitlinker.nvim";
          rev = "542f51784f20107ef9ecdadc47825204837efed5";
          hash = "sha256-OnlJf31dTzLOJ1tlDKH7slPnQGMZUloavEAtd/FxK0U=";
        };
      };
    in
    [ { plugin = gitlinker-nvim; } ];

  extraConfigLua = # lua
    ''
      require('gitlinker').setup({
        message = false,
        highlight_duration = 0,
        router = {
          browse = {
            ["^git%..*%.com"] = require('gitlinker.routers').gitlab_browse,
          },
          blame = {
            ["^git%..*%.com"] = require('gitlinker.routers').gitlab_blame,
          },
        },
      })

      vim.keymap.set({'n','v'},'gC','<Cmd>GitLink!browse<CR>',{noremap = true, silent = true, desc = 'Open git code'})
      vim.keymap.set({'n','v'},'gB','<Cmd>GitLink!blame<CR>',{noremap = true, silent = true, desc = 'Open git blame'})
    '';

}
