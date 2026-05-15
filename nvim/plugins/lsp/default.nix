{ pkgs, ... }:
{

  imports = [
    ./nix.nix
    ./otter-nvim.nix
    ./trouble.nix
    # ./yaml-helm.nix
    ./yaml-helm-detect.nix
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
    opentofu
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
          package = pkgs.ansible-language-server;
          settings = {
            ansible = {
              validation = {
                lint = {
                  arguments = "--nocolor --offline";
                };
              };
            };
          };
        };
        docker_compose_language_service.enable = true;
        dockerls.enable = true;
        jsonls.enable = true;
        tflint.enable = true;
        tofu_ls.enable = true;
      };
    };

  };

  extraConfigLua = # lua
    ''
      vim.lsp.config('*', {
        handlers = {
          ['textDocument/hover'] = { border = 'rounded' },
          ['textDocument/signatureHelp'] = { border = 'rounded' },
        },
      })

      
      vim.diagnostic.config {
        virtual_text = { prefix = "" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          }
        }
      }

      map("n", "<leader>lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP rename" })
      map("n", "<leader>lR", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "LSP references" })
      map("n", "<leader>lD", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "LSP definition" })
      map("n", "<leader>li", "<Cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "LSP implementation" })
    '';

}
