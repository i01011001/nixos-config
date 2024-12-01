{
  programs.nixvim.plugins = {

    lualine = {
      enable = true;
      globalstatus = true;
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "diagnostics" ];
        lualine_c = [ "" ];
        lualine_x = [ "filetype" "filename" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
      theme = {
        normal = {
          a = {
            fg = "##999999";
            bg = "#000000";
            gui = "bold";
          };
          b = { bg = "#000000"; };
          c = { bg = "#000000"; };
        };
        insert = {
          a = {
            fg = "#999999";
            bg = "#000000";
            gui = "bold";
          };
          b = {
            bg = "000000";

          };
          c = {
            fg = "#999999";
            bg = "#000000";
          };
        };
        visual = {
          a = {
            fg = "#999999";
            bg = "#000000";
            gui = "bold";
          };
          b = {
            fg = "#999999";
            bg = "#000000";
          };
          c = {
            fg = "#999999";
            bg = "#000000";
          };
        };
        replace = {
          a = {
            fg = "#999999";
            bg = "#000000";
            gui = "bold";
          };
          b = {
            fg = "#999999";
            bg = "#000000";
          };
          c = {
            fg = "#999999";
            bg = "#000000";
          };
        };
        command = {
          a = {
            fg = "#999999";
            bg = "#000000";
            gui = "bold";
          };
          b = {
            fg = "#999999";
            bg = "#000000";
          };
          c = {
            fg = "#999999";
            bg = "#000000";
          };
        };
        inactive = {
          a = {
            fg = "#999999";
            bg = "#000000";
            gui = "bold";
          };
          b = {
            fg = "#999999";
            bg = "#000000";
          };
          c = {
            fg = "#999999";
            bg = "#000000";
          };
        };
      };
    };
  };
}
