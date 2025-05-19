{ pkgs, ... }: {

  imports = [
    ./lspkind.nix
    ./nixd.nix
    ./none-ls.nix
    ./otter-nvim.nix
    ./trouble.nix
    ./yaml-helm.nix
  ];

  highlightOverride = { # Remove BG from diagnostic inline messages
    DiagnosticVirtualTextError.link = "DiagnosticError";
    DiagnosticVirtualTextWarn.link = "DiagnosticWarn";
    DiagnosticVirtualTextInfo.link = "DiagnosticInfo";
    DiagnosticVirtualTextHint.link = "DiagnosticHint";
  };

  extraPackages = with pkgs; [ ansible-lint ];

  plugins = {

    lsp = {
      enable = true;
      servers = {
        # langs
        bashls.enable = true;
        gopls.enable = true;
        lua_ls = {
          enable = true;
          settings.diagnostics.globals = [ "vim" "require" ];
        };
        pylsp.enable = true;
        ruff.enable = true;

        # devops
        ansiblels.enable = true;
        docker_compose_language_service.enable = true;
        dockerls.enable = true;
        jsonls.enable = true;
        terraformls.enable = true;
        tflint.enable = true;
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

      vim.keymap.set('n','<leader>lr','<Cmd>lua vim.lsp.buf.rename()<CR>',{noremap = true, silent = true, desc = 'LSP rename'})
      vim.keymap.set('n','<leader>lR','<Cmd>lua vim.lsp.buf.references()<CR>',{noremap = true, silent = true, desc = 'LSP references'})
      vim.keymap.set('n','<leader>lD','<Cmd>lua vim.lsp.buf.definition()<CR>',{noremap = true, silent = true, desc = 'LSP definition'})
      vim.keymap.set('n','<leader>li','<Cmd>lua vim.lsp.buf.implementation()<CR>',{noremap = true, silent = true, desc = 'LSP implementation'})
    '';

}
