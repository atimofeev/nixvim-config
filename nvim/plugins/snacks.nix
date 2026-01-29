{ config, pkgs, ... }:
{

  extraPackages = with pkgs; [
    fd # file listing in picker
    ghostscript_headless # pdf preview in picker
  ];

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
          sources = {
            files = {
              hidden = true;
            };
            projects = {
              dev = [ "~/repos" ];
              max_depth = 5;
              inherit (config.plugins.project-nvim.settings) patterns;
            };
          };
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

    -- find
    map("n", "<leader><leader>", "<Cmd>lua Snacks.picker.projects()<CR>", { desc = "Projects" })
    map("n", "<leader>fl", "<Cmd>lua Snacks.picker.smart()<CR>", { desc = "Files" })
    map("n", "<leader>fr", "<Cmd>lua Snacks.picker.recent()<CR>", { desc = "Recent files" })
    map("n", "<leader>fb", "<Cmd>lua Snacks.picker.buffers()<CR>", { desc = "Buffers" })

    -- grep
    map("n", "<leader>fs", "<Cmd>lua Snacks.picker.grep()<CR>", { desc = "Grep" })
    map("n", "<leader>fS", "<Cmd>lua Snacks.picker.grep_buffers()<CR>", { desc = "Grep (open buffers)" })
    map("n", "<leader>fz", "<Cmd>lua Snacks.picker.lines()<CR>", { desc = "Grep (buffer)" })
    map("n", "<leader>ft", "<Cmd>lua Snacks.picker.todo_comments()<CR>", { desc = "TODOs" })

    -- search
    map("n", "<leader>fh", "<Cmd>lua Snacks.picker.help()<CR>", { desc = "Help" })
    map("n", "<leader>fk", "<Cmd>lua Snacks.picker.keymaps()<CR>", { desc = "Keymaps" })
    map("n", "<leader>fH", "<Cmd>lua Snacks.picker.highlights()<CR>", { desc = "Highlights" })
    map("n", "<leader>fn", "<Cmd>lua Snacks.picker.notifications()<CR>", { desc = "Notifications" })
    map("n", "<leader>fc", "<Cmd>lua Snacks.picker.command_history()<CR>", { desc = "Command history" })

    -- git
    map("n", "<leader>fgc", "<Cmd>lua Snacks.picker.git_log_file()<CR>", { desc = "Git commits (buffer)" })
    map("n", "<leader>fgC", "<Cmd>lua Snacks.picker.git_log()<CR>", { desc = "Git commit" })
    map("n", "<leader>fgs", "<Cmd>lua Snacks.picker.git_status()<CR>", { desc = "Git status" })
    map("n", "<leader>fgS", "<Cmd>lua Snacks.picker.git_stash()<CR>", { desc = "Git stash" })
    map("n", "<leader>fgb", "<Cmd>lua Snacks.picker.git_branches()<CR>", { desc = "Git branches" })

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
