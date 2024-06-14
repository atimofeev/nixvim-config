_: {

  plugins.telescope.enable = true;

  # nvchad config dump
  extraConfigLua = # lua
    ''
      -- Borderless telescope views
      local colors = require("catppuccin.palettes").get_palette()
      local TelescopeColor = {
        TelescopeMatching = { fg = colors.flamingo },
        TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
        TelescopePromptPrefix = { bg = colors.surface0 },
        TelescopePromptNormal = { bg = colors.surface0 },
        TelescopeResultsNormal = { bg = colors.mantle },
        TelescopePreviewNormal = { bg = colors.mantle },
        TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
        TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
        TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
        TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
        TelescopeResultsTitle = { fg = colors.mantle },
        TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
      }

      for hl, col in pairs(TelescopeColor) do
        vim.api.nvim_set_hl(0, hl, col)
      end

      local telescope = require('telescope')
      telescope.setup{
        defaults = {   
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "--follow",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--sortr=modified",
          },
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "flex",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
            vertical = {
              prompt_position = "top",
              mirror = true;
            },
            width = 0.90,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules", ".git/", ".mypy_cache", ".terraform" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            n = {
              ["q"] = require("telescope.actions").close,
              ["<esc>"] = require("telescope.actions").close,
              ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
              ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
              ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
              ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
            },
            i = {
              ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
              ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
              ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
              ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
            },
          },
        },
        extensions_list = { "themes", "terms" },
        pickers = { find_files = {
            hidden = true,
            find_command = {"rg", "--files", "--sortr=modified"};
          },
        },
      }
    '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd> Telescope file_browser <cr>";
      options.desc = "File browser";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd> Telescope find_files <cr>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>fa";
      action =
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>";
      options.desc = "Find all files";
    }
    {
      mode = "n";
      key = "<leader>fw";
      action = "<cmd> Telescope live_grep <cr>";
      options.desc = "Find word";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd> Telescope buffers <cr>";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd> Telescope help_tags <cr>";
      options.desc = "Find help";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd> Telescope oldfiles <cr>";
      options.desc = "Find recent";
    }
    {
      mode = "n";
      key = "<leader>fz";
      action = "<cmd> Telescope current_buffer_fuzzy_find <cr>";
      options.desc = "Find word (buffer)";
    }
    {
      mode = "n";
      key = "<leader>fgc";
      action = "<cmd> Telescope git_commits <cr>";
      options.desc = "Find git commits";
    }
    {
      mode = "n";
      key = "<leader>fgs";
      action = "<cmd> Telescope git_status <cr>";
      options.desc = "Find git status";
    }
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd> Telescope projects <cr>";
      options.desc = "Find projects";
    }
    {
      mode = "n";
      key = "<leader><leader>";
      action = "<cmd> Telescope projects <cr>";
      options.desc = "Find projects";
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd> TodoTelescope <cr>";
      options.desc = "Find TODOs";
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = "<cmd> Telescope keymaps <cr>";
      options.desc = "Find keymaps";
    }
  ];
}
