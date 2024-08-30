{pkgs,...}:{
  
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
  in [ { plugin = jinja.vim; }  ];
  autoCmd = [
    {
      event = [ "BufEnter" ];
      pattern = [ "*.j2" "*.tmpl" ];
      command = "TSBufDisable highlight | LspStop";
    }
  ];

           }
