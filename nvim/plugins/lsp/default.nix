_: {

  imports = [
    ./fidget.nix
    ./lspkind.nix
    ./none-ls.nix
    ./otter-nvim.nix
    ./trouble.nix
    ./yaml.nix
  ];

  highlightOverride = { # Remove BG from diagnostic inline messages
    DiagnosticVirtualTextError.link = "DiagnosticError";
    DiagnosticVirtualTextWarn.link = "DiagnosticWarn";
    DiagnosticVirtualTextInfo.link = "DiagnosticInfo";
    DiagnosticVirtualTextHint.link = "DiagnosticHint";
  };

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

  };

  extraConfigLua = # lua
    ''
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = { prefix = "", },
      })
    '';

  keymaps = [
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
