_: {

  plugins = {
    obsidian = {
      enable = true;
      settings = {

        workspaces = [
          {
            name = "default";
            path = "~/repos/obsidian-vault";
          }
        ];

        daily_notes = {
          folder = "daily";
          default_tags = [ "daily" ];
          template = "daily-tmpl";
        };

        notes_subdir = "notes";
        new_notes_location = "notes_subdir";

        note_id_func = # lua
          ''
            function(title)
              if title then -- transform title into valid filename
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
              else
                local suffix = "" -- generate filename (timestamp-ABCD)
                for _ = 1, 4 do
                  suffix = suffix .. string.char(math.random(65, 90))
                end
                return os.time() .. "-" .. suffix
              end
            end
          '';

        templates = {
          folder = "assets/templates";
        };

        ui = {
          checkboxes = {
            " " = {
              char = "󰄱";
              hl_group = "ObsidianTodo";
            };
            x = {
              char = "";
              hl_group = "ObsidianDone";
            };
          };
        };

        attachments = {
          img_folder = "assets/img";
          confirm_img_paste = false;
        };

      };
    };

  };

  opts.conceallevel = 2;

  autoCmd = [
    {
      event = [ "BufEnter" ];
      pattern = [ "*.md" ];
      command = "TSBufDisable indent";
    }
  ];

  extraConfigLua = # lua
    ''
      function map(mode, lhs, rhs, opts)
        local options = {noremap = true, silent = true}
        if opts then
          options = vim.tbl_extend("force", options, opts)
        end
        vim.keymap.set(mode, lhs, rhs, options)
      end

      map('n','<leader>ns','<Cmd>ObsidianSearch<CR>',{desc = 'Obsidian search'})
      map('n','<leader>nl','<Cmd>ObsidianQuickSwitch<CR>',{desc = 'Obsidian list'})
      map('n','<leader>np','<Cmd>ObsidianPasteImg<CR>',{desc = 'Obsidian paste IMG'})
      map('n','<leader>nd','<Cmd>ObsidianDailies<CR>',{desc = 'Obsidian daily'})
      map('n','<leader>nn','<Cmd>ObsidianNew<CR>',{desc = 'Obsidian new note'})
      map('n','<leader>nb','<Cmd>ObsidianBacklinks<CR>',{desc = 'Obsidian backlinks'})
      map('n','<leader>nt','<Cmd>ObsidianTags<CR>',{desc = 'Obsidian tags'})
    '';
}
