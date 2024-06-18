_: {
  imports = [
    ./dashboard.nix
    ./filetree.nix
    ./git.nix
    ./oil.nix
    ./spectre.nix
    ./statusline.nix
    ./tabs.nix
    ./telescope.nix
    ./term.nix
  ];

  colorschemes = {
    catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
    };
  };

  highlightOverride = { # Remove BG from diagnostic inline messages
    DiagnosticVirtualTextError.link = "DiagnosticError";
    DiagnosticVirtualTextWarn.link = "DiagnosticWarn";
    DiagnosticVirtualTextInfo.link = "DiagnosticInfo";
    DiagnosticVirtualTextHint.link = "DiagnosticHint";
  };

  extraConfigLua = # lua
    ''
      local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = { prefix = "", },
      })
    '';

  plugins = {

    fidget.enable = true; # lsp status notifications

    lspkind.enable = true; # lsp cmp icons

    markdown-preview.enable = true;

    which-key = {
      enable = true;
      registrations = {
        "<leader>l".name = "+lsp";
        "<leader>f" = { name = "+find"; };
        "<leader>fg" = { name = "+git"; };
        "<leader>t" = { name = "+term"; };
        "<leader>T" = { name = "+tabs"; };
        "gz" = { name = "+surround"; };
      };
    };

    project-nvim = {
      enable = true;
      enableTelescope = true;
      showHidden = true;
      patterns = [ ".git" ];
      ignoreLsp = [ "null-ls" "dockerls" ];
    };

  };
}
