{

  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      snippet.expand =
        "function(args) require('luasnip').lsp_expand(args.body) end";
      window.completion = {
        scrollbar = false;
        border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
        winhighlight =
          "Normal:Normal,FloatBorder:Normal,CursorLine:IncSearch,Search:None";
      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "buffer"; }
        { name = "nvim_lua"; }
        { name = "path"; }
        { name = "calc"; }
        { name = "emoji"; }
      ];
      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-e>" = "cmp.mapping.close()";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<CR>" = "cmp.mapping.confirm()";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };
    };
  };

}
