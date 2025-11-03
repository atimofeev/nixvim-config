{ pkgs, ... }:
{

  imports = [
    # ./lspkind.nix
    ./nix.nix
    # ./none-ls.nix
    ./otter-nvim.nix
    ./trouble.nix
    ./yaml-helm.nix
  ];

  highlightOverride = {
    # NOTE: Remove BG from diagnostic inline messages
    DiagnosticVirtualTextError.link = "DiagnosticError";
    DiagnosticVirtualTextWarn.link = "DiagnosticWarn";
    DiagnosticVirtualTextInfo.link = "DiagnosticInfo";
    DiagnosticVirtualTextHint.link = "DiagnosticHint";

    # NOTE: setup float window style
    NormalFloat.link = "Normal";
    FloatBorder.link = "Normal";
  };

  extraPackages = with pkgs; [
    nodejs
    ansible-lint
  ];

  plugins = {

    lsp = {
      enable = true;
      servers = {
        # langs
        bashls.enable = true;
        gopls.enable = true;
        lua_ls = {
          enable = true;
          settings.diagnostics = {
            disable = [ "miss-name" ];
            globals = [
              "map"
              "require"
              "vim"
            ];
          };
        };
        pylsp.enable = true;
        ruby_lsp.enable = true;
        ruff.enable = true;

        # devops
        ansiblels = {
          enable = true;
          package = null;
        };
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
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config {
        virtual_text = { prefix = "" },
      }

      map("n", "<leader>lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP rename" })
      map("n", "<leader>lR", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP references" })
      map("n", "<leader>lD", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP definition" })
      map("n", "<leader>li", "<Cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP implementation" })
    '';

}
