_: {
  plugins = {

    luasnip = {
      enable = true;
      extraConfig = {
        history = true;
        updateevents = "TextChanged,TextChangedI";
      };
    };

    friendly-snippets.enable = true;

    cmp-cmdline.enable = true;

    nvim-cmp = {
      enable = true;
      snippet.expand = "luasnip";
      autoEnableSources = true;
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "buffer"; }
        { name = "nvim_lua"; }
        { name = "path"; }
        { name = "calc"; }
        { name = "emoji"; }
      ];

      window.completion = {
        scrollbar = false;
        border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
        winhighlight =
          "Normal:Normal,FloatBorder:Normal,CursorLine:IncSearch,Search:None";
      };

      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<CR>" = "cmp.mapping.confirm({select=true})";
        "<Tab>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                fallback()
              end
            end 
          '';
          modes = [ "i" "s" ];
        };

        "<S-Tab>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
              else
                fallback()
              end
            end
          '';
          modes = [ "i" "s" ];
        };
      };
    };
  };

  extraConfigLua = ''
    local cmp = require('cmp')
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'path' }, {
            name = 'cmdline',
            option = { ignore_cmds = { 'Man', '!' } },
        } },
    })
  '';
}
