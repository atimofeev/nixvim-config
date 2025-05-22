{

  plugins = {

    lsp.servers.lua_ls.settings.diagnostics.globals = [ "Snacks" ];

    snacks = {
      enable = true;
      settings = {
        bigfile.enabled = true;
        notifier = {
          enabled = true;
          timeout = 6000;
        };
        input.enabled = true;
        words.enabled = false;
        toggle.enable = true;
      };
    };

  };

  extraConfigLuaPost = ''
    Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>ts"
    Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>tw"
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>tL"
    Snacks.toggle.diagnostics():map "<leader>td"
    Snacks.toggle.line_number():map "<leader>tl"
    Snacks.toggle
      .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" })
      :map "<leader>tc"
    Snacks.toggle
      .option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" })
      :map "<leader>tA"
    Snacks.toggle.treesitter():map "<leader>tT"
    Snacks.toggle.dim():map "<leader>tD"
    Snacks.toggle.animate():map "<leader>ta"
    -- Snacks.toggle.indent():map "<leader>tg"
    Snacks.toggle.scroll():map "<leader>tS"
    Snacks.toggle
      .new({
        id = "auto_formatting",
        name = "Auto Formatting",
        get = function()
          return vim.g.autoformat or false
        end,
        set = function(state)
          vim.g.autoformat = state
        end,
      })
      :map "<leader>tf"
  '';

}
