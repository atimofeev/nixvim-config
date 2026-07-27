{ pkgs, ... }:
{

  extraConfigLuaPre = # lua
    ''
      vim.g.loaded_gitlinker = 1
    '';

  extraPlugins =
    let
      gitlinker-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "gitlinker.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "linrongbin16";
          repo = "gitlinker.nvim";
          rev = "a1b74070bbd5e50128190c85b09f1431ea5fbd83";
          hash = "sha256-dzo+wrDuWxrv041wgxUZvBpZO4pWbZ/C8zlwEnssyGY=";
        };
        nvimSkipModules = [ "spec_init" ];
      };
    in
    [ { plugin = gitlinker-nvim; } ];

  extraConfigLua = # lua
    ''
      require("gitlinker").setup {
        message = false,
        highlight_duration = 0,
        router = {
          browse = {
            ["^git%.[^/:%s]+%.com$"] = require("gitlinker.routers").gitlab_browse,
          },
          blame = {
            ["^git%.[^/:%s]+%.com$"] = require("gitlinker.routers").gitlab_blame,
          },
        },
      }

      function _G.gitlinker_action(op)
        vim.cmd("GitLink!" .. op)
      end

      map({ "n", "v" }, "gC", '<Cmd>lua gitlinker_action("browse")<CR>', { desc = "Open git code" })
      map({ "n", "v" }, "gB", '<Cmd>lua gitlinker_action("blame")<CR>', { desc = "Open git blame" })
    '';

}
