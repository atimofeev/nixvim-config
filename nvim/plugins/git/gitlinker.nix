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
      function _G.gitlinker_action(op)
        if not package.loaded["gitlinker"] then
          require("gitlinker").setup {
            message = false,
            highlight_duration = 0,
            router = {
              browse = {
                ["^git%..*%.com"] = require("gitlinker.routers").gitlab_browse,
              },
              blame = {
                ["^git%..*%.com"] = require("gitlinker.routers").gitlab_blame,
              },
            },
          }
        end
        vim.cmd("GitLink!" .. op)
      end

      map({ "n", "v" }, "gC", '<Cmd>lua gitlinker_action("browse")<CR>', { desc = "Open git code" })
      map({ "n", "v" }, "gB", '<Cmd>lua gitlinker_action("blame")<CR>', { desc = "Open git blame" })
    '';

}
