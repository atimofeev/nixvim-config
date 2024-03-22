{ ... }: {
  imports = [ ./none-ls.nix ];

  plugins = {

    lsp = {
      enable = true;
      servers = {
        # langs
        lua-ls.enable = true;
        pylsp.enable = true;
        ruff-lsp.enable = true;
        gopls.enable = true;
        bashls.enable = true;
        # nil_ls.enable = true;
        nixd.enable = true;
        # devops
        ansiblels.enable = true;
        dockerls.enable = true;
        # docker_compose_language_service.enable = true;
        # groovyls.enable = true;
        helm-ls.enable = true;
        jsonls.enable = true;
        # powershell_es.enable = true;
        terraformls.enable = true;
        yamlls.enable = true;
      };
    };

    trouble = {
      enable = true;
      useDiagnosticSigns = true;
      # settings.use_diagnostic_signs = true;
    };
  };

  keymaps = [{
    mode = "n";
    key = "<leader>d";
    action = "<cmd> TroubleToggle <cr>";
    options.desc = "Diagnostics";
  }];
}
