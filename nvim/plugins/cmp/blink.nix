{ pkgs, ... }:
{

  extraPackages = with pkgs; [
    gh
    glab
  ];

  plugins = {
    blink-cmp-git.enable = true;
    blink-compat.enable = true;
    blink-emoji.enable = true;

    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          preset = "enter";
          "<C-space>" = [
            "show"
            "hide"
          ];
          "<Tab>" = [
            "show"
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "fallback"
          ];
          "<C-n>" = [
            "snippet_forward"
            "fallback"
          ];
          "<C-p>" = [
            "snippet_backward"
            "fallback"
          ];
        };
        completion = {
          list.selection.preselect = false;
          documentation = {
            auto_show = true;
            window.border = "rounded";
          };
          menu = {
            border = "rounded";
            draw = {
              columns = [
                { __unkeyed-1 = "label"; }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
              ];
            };
            winhighlight = "CursorLine:IncSearch,Search:None";
          };
        };
        signature = {
          enabled = true;
          window.border = "rounded";
        };
        sources = {
          default = [
            "buffer"
            "calc"
            "emoji"
            "git"
            "lsp"
            "path"
            "snippets"
          ];
          providers = {
            lsp.score_offset = 4;
            buffer = {
              opts = {
                # Get suggestions from all "normal" open buffers
                get_bufnrs.__raw = ''
                  function()
                    return vim.tbl_filter(function(bufnr)
                      return vim.bo[bufnr].buftype == ""
                    end, vim.api.nvim_list_bufs())
                   end
                '';
              };
            };
            calc = {
              name = "calc";
              module = "blink.compat.source";
              score_offset = 2;
            };
            emoji = {
              name = "Emoji";
              module = "blink-emoji";
              score_offset = 1;
            };
            git = {
              name = "Git";
              module = "blink-cmp-git";
              enabled = true;
              score_offset = 100;
              should_show_items.__raw = ''
                function()
                  return vim.o.filetype == 'gitcommit' or vim.o.filetype == 'markdown'
                end
              '';
              opts = {
                git_centers = {
                  github = {
                    issue = {
                      on_error.__raw = "function(_,_) return true end";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };

  };

}
