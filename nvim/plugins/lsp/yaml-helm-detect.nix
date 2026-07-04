{

  plugins = {
    helm.enable = true;
    lsp.servers = {
      helm_ls.enable = true;
      yamlls = {
        enable = true;
        settings = {
          customTags = [
            "!reference sequence" # NOTE: gitlab-ci built-in tag
          ];
        };
      };
    };
    yaml-schema-detect = {
      enable = true;
      settings.disable_keymap = true;
    };
  };

}
