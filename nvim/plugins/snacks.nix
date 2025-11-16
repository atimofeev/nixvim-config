{ pkgs, ... }:
{

  extraPackages = with pkgs; [ ghostscript_headless ]; # NOTE: pdf preview in picker

  plugins = {

    lsp.servers.lua_ls.settings.diagnostics.globals = [ "Snacks" ];

    snacks = {
      enable = true;
      settings = {
        bigfile.enabled = true;
        image.enabled = true;
        input.enabled = true;
        notifier = {
          enabled = true;
          timeout = 6000;
        };
        picker = {
          enabled = true;
          matcher = {
            cwd_bonus = true;
            frecency = true;
            history_bonus = true;
          };
        };
        statuscolumn.enabled = true;
        toggle.enable = true; # TODO: integrate with which-key https://github.com/folke/snacks.nvim/blob/main/docs/toggle.md
        words.enabled = false;
      };
    };

  };

  extraConfigLuaPost = ''
    local colors = require("catppuccin.palettes").get_palette()
    local PickerColor = {
      SnacksPickerBox = { bg = colors.mantle },
      SnacksPickerBoxBorder = { bg = colors.mantle, fg = colors.mantle },
      SnacksPickerBoxTitle = { bg = colors.pink, fg = colors.mantle },
      SnacksPickerInput = { bg = colors.mantle },
      SnacksPickerInputBorder = { bg = colors.mantle, fg = colors.surface0 },
      SnacksPickerList = { bg = colors.mantle },
      SnacksPickerListBorder = { bg = colors.mantle, fg = colors.mantle },
      SnacksPickerListTitle = { fg = colors.mantle },
      SnacksPickerPreview = { bg = colors.mantle },
      SnacksPickerPreviewBorder = { bg = colors.mantle, fg = colors.mantle },
      SnacksPickerPreviewTitle = { bg = colors.green, fg = colors.mantle },
    }

    for hl, col in pairs(PickerColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    map("n", "<leader>fl", "<Cmd>lua Snacks.picker.smart()<CR>", { desc = "List files" })
    map("n", "<leader>fs", "<Cmd>lua Snacks.picker.grep()<CR>", { desc = "Search word" })
    map("n", "<leader>fb", "<Cmd>lua Snacks.picker.buffers()<CR>", { desc = "Find buffers" })
    map("n", "<leader>fh", "<Cmd>lua Snacks.picker.help()<CR>", { desc = "Find help" })
    map("n", "<leader>fr", "<Cmd>lua Snacks.picker.recent()<CR>", { desc = "Find recent" })
    map("n", "<leader>fz", "<Cmd>lua Snacks.picker.lines()<CR>", { desc = "Find word (buffer)" })
    map("n", "<leader>fgc", "<Cmd>lua Snacks.picker.git_log_file()<CR>", { desc = "Find git buffer commits" })
    map("n", "<leader>fgC", "<Cmd>lua Snacks.picker.git_log()<CR>", { desc = "Find git commits" })
    map("n", "<leader>fgs", "<Cmd>lua Snacks.picker.git_status()<CR>", { desc = "Find git status" })
    map("n", "<leader>fgS", "<Cmd>lua Snacks.picker.git_stash()<CR>", { desc = "Find git stash" })
    map("n", "<leader>fgb", "<Cmd>lua Snacks.picker.git_branches()<CR>", { desc = "Find git branches" })
    map("n", "<leader>fk", "<Cmd>lua Snacks.picker.keymaps()<CR>", { desc = "Find keymaps" })
    map("n", "<leader>ft", "<Cmd>lua Snacks.picker.todo_comments()<CR>", { desc = "Find TODOs" })
    map("n", "<leader><leader>", "<Cmd>lua Snacks.picker.projects()<CR>", { desc = "Find projects" })
    map("n", "<leader>fh", "<Cmd>lua Snacks.picker.highlights()<CR>", { desc = "Find highlights" })

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
    Snacks.toggle.indent():map "<leader>ti"
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
