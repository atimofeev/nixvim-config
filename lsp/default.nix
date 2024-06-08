_: {
  imports = [ ./none-ls.nix ./yaml.nix ];

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
        nixd.enable = true;
        # devops
        ansiblels.enable = true;
        dockerls.enable = true;
        # https://github.com/nix-community/nixvim/issues/1426
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
      settings.use_diagnostic_signs = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd> TroubleToggle <cr>";
      options.desc = "LSP diagnostics";
    }
    {
      mode = "n";
      key = "<leader>lr";
      action = "<cmd> lua vim.lsp.buf.rename() <cr>";
      options.desc = "LSP rename";
    }
    {
      mode = "n";
      key = "<leader>lR";
      action = "<cmd> lua vim.lsp.buf.references() <cr>";
      options.desc = "LSP references";
    }
    {
      mode = "n";
      key = "<leader>lD";
      action = "<cmd> lua vim.lsp.buf.definition() <cr>";
      options.desc = "LSP definition";
    }
    {
      mode = "n";
      key = "<leader>li";
      action = "<cmd> lua vim.lsp.buf.implementation() <cr>";
      options.desc = "LSP implementation";
    }
    # Map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
  ];
}
