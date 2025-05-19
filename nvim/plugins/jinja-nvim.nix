{ pkgs, lib, ... }: {

  extraPlugins = let
    jinja.vim = pkgs.vimUtils.buildVimPlugin {
      name = "jinja.vim";
      src = pkgs.fetchFromGitHub {
        owner = "HiPhish";
        repo = "jinja.vim";
        rev = "ca97dafc82c012b3a9005a12a673d2cfa854376d";
        hash = "sha256-txhRGtriIHg8oTRIUpn37OVlZtBJwPeOJQoYBFIu6JE=";
      };
    };
  in [{ plugin = jinja.vim; }];

  autoCmd = [{
    event = [ "BufEnter" "BufReadPost" ];
    pattern = [ "*.j2" ];
    callback = lib.nixvim.mkRaw ''
      function(args)
        vim.cmd('TSBufDisable highlight')
        vim.cmd('LspStop')
        vim.diagnostic.reset(nil, args.buf)
      end
    '';
  }];

}
