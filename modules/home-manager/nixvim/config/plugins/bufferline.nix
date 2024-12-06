{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      # highlights.separatorVisible.fg = "#000000";
      settings = {
        options = {
          always_show_bufferline = false;
          buffer_close_icon = "";
          close_icon = "";
        };
        highlights = {
          buffer_selected = {
            bg = "#000000";
            fg = "#cccccc";
          };
          fill = {
            bg = "#000000";
          };
          numbers_selected = {
            bg = "#000000";
          };
          separator = {
            fg = "#000000";
          };
          separator_selected = {
            bg = "#000000";
            fg = "#1e2030";
          };
          separator_visible = {
            fg = "#1e2030";
          };
          tab_selected = {
            bg = "#000000";
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "]b";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }

      {
        mode = "n";
        key = "[b";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
      }

      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Cycle to next buffer";
        };
      }

      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Cycle to previous buffer";
        };
      }

      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        options = {
          desc = "Delete buffer";
        };
      }

      {
        mode = "n";
        key = "<leader>bl";
        action = "<cmd>BufferLineCloseLeft<cr>";
        options = {
          desc = "Delete buffers to the left";
        };
      }

      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options = {
          desc = "Delete other buffers";
        };
      }

      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>BufferLineTogglePin<cr>";
        options = {
          desc = "Toggle pin";
        };
      }

      {
        mode = "n";
        key = "<leader>bP";
        action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
        options = {
          desc = "Delete non-pinned buffers";
        };
      }
    ];
  };
}
