{ pkgs, lib, ... }:
{

  extraPlugins =
    let
      jinja.vim = pkgs.vimUtils.buildVimPlugin {
        name = "jinja.vim";
        src = pkgs.fetchFromGitHub {
          owner = "HiPhish";
          repo = "jinja.vim";
          rev = "05373374a288b20845937cbc3a7abda23a2e65d2";
          hash = "sha256-ubZo3TYi72WqcGoSoveYRYcwOYk4oNW28uAYw939u5M=";
        };
      };
    in
    [ { plugin = jinja.vim; } ];

  autoCmd = [
    {
      event = [
        "BufEnter"
        "BufReadPost"
      ];
      pattern = [ "*.j2" ];
      callback = lib.nixvim.mkRaw ''
        function(args)
          pcall(vim.treesitter.stop, args.buf)
          local clients = vim.lsp.get_clients({ bufnr = args.buf })
          for _, client in ipairs(clients) do
            vim.lsp.stop_client(client.id)
          end
          vim.diagnostic.reset(nil, args.buf)
        end'';

    }
  ];

}
