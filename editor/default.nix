{ ... }: {
  imports = [ ./cmp.nix ./code-hl.nix ];

  plugins = {

    better-escape.enable = true;

    autoclose.enable = true;

    comment-nvim.enable = true;

    # TODO: learn KBs: https://github.com/echasnovski/mini.surround
    mini = {
      enable = true;
      modules.surround = { };
    };

    # TODO: setup these plugins
    leap.enable = true;
    harpoon = {
      enable = true;
      enableTelescope = true;
    };

  };
}
