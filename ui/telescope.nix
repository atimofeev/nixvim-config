{ ... }: {
  # TODO: redo preview_scrolling_* keymaps (C-hjkl)

  # NOTE: Use (C-/) to see keys for current telescope view
  plugins.telescope = {
    enable = true;
    extensions.project-nvim.enable = true;
  };

  # nvchad config dump
  extraConfigLua = ''
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
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
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
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      extensions_list = { "themes", "terms" },
    }
  '';

  keymaps = [
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
  ];
}
