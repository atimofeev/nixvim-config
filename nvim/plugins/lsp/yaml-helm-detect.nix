{

  plugins = {
    helm.enable = true;
    lsp.servers = {
      helm_ls.enable = true;
      yamlls.enable = true;
    };
    yaml-schema-detect = {
      enable = true;
      settings.disable_keymap = true;
    };
  };

}
