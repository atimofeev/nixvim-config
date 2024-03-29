{ pkgs, ... }: {
  imports = [
    ./filetree.nix
    ./git.nix
    ./statusline.nix
    ./tabs.nix
    ./telescope.nix
    ./term.nix
  ];

  colorschemes = {
    catppuccin = {
      enable = true;
      flavour = "macchiato";
      dimInactive.enabled = true;
    };
  };

  highlightOverride = { # Remove BG from diagnostic inline messages
    DiagnosticVirtualTextError.link = "DiagnosticError";
    DiagnosticVirtualTextWarn.link = "DiagnosticWarn";
    DiagnosticVirtualTextInfo.link = "DiagnosticInfo";
    DiagnosticVirtualTextHint.link = "DiagnosticHint";
  };

  extraConfigLua = ''
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

    # TODO: setup this plugin
    oil.enable = true; # file browser (and editor)

    which-key = {
      enable = true;
      registrations = {
        "<leader>l".name = "+lsp";
        "<leader>f" = { name = "+find"; };
        "<leader>fg" = { name = "+git"; };
        "<leader>t" = { name = "+tabs"; };
        "gz" = { name = "+surround"; };
      };
    };

    project-nvim = {
      enable = true;
      patterns = [ ".git" ];
      ignoreLsp = [ "null-ls" ];
    };

  };
}
