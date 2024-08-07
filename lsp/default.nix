_: {
  imports = [ ./none-ls.nix ./yaml.nix ];

  plugins = {

    lsp = {
      enable = true;
      servers = {

        # langs
        lua-ls = {
          enable = true;
          settings.diagnostics.globals = [ "vim" "require" ];
        };
        pylsp.enable = true;
        ruff-lsp.enable = true;
        gopls.enable = true;
        bashls.enable = true;
        nixd.enable = true;

        # devops
        ansiblels.enable = true;
        dockerls.enable = true;
        docker-compose-language-service.enable = true;
        helm-ls.enable = true;
        jsonls.enable = true;
        terraformls.enable = true;
        tflint.enable = true;
        yamlls.enable = true;
      };
    };

    trouble = {
      enable = true;
      settings.use_diagnostic_signs = true;
    };
  };
  autoCmd = [{
    event = [ "BufEnter" ];
    pattern = [ "Trouble" ];
    command = "setlocal wrap";
  }];

  extraConfigLua = # lua
    ''
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })'';

  keymaps = [
    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd> Trouble diagnostics toggle <cr>";
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
  ];
}
