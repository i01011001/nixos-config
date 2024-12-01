{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      routes = [
        {
          view = "notify";
          filter = { event = "msg_showmode"; };
        }
        {
          view = "cmdline";
          filter = { event = "msg_showmode"; };
        }
        # { filter = { event = "lsp"; kind = "progress"; opts = { skip = true ;}; };}
      ];

      presets = {
        bottom_search = false;
        command_palette = true;
        long_message_to_split = false;
        inc_rename = false;
        lsp_doc_border = true;

      };

      cmdline.format = {
        cmdline = {
          icon = "";
          lang = "vim";
          pattern = "^:";
        };
        filter = {
          icon = "";
          lang = "bash";
          pattern = "^:%s*!";
        };
        help = {
          icon = "";
          pattern = "^:%s*he?l?p?%s+";
        };
        input = { };
        lua = {
          icon = "";
          lang = "lua";
          pattern = "^:%s*lua%s+";
        };
        search_down = {
          icon = "";
          kind = "search";
          lang = "regex";
          pattern = "^/";
        };
        search_up = {
          icon = "";
          kind = "search";
          lang = "regex";
          pattern = "?%?";
        };
      };
    };

  };

}
