{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 3;
          y = 3;
        };
        decorations = "None";
      };
      font = {
        normal = {
          # family = "Mononoki Nerd Font Mono";
          family = "Mononoki Nerd Font";
          style = "Regular";
        };
        size = 10;
        # offset = {
        #   y = -2;
        # };
      };
      keyboard = {
        bindings = [
          {
            key = "N";
            mods = "Control|Shift";
            action = "SpawnNewInstance";
          }
        ];
      };
      colors = {
        primary = {
          background = "#000000";
          foreground = "#d0d0d0";
        };
        normal = {
          black = "#303030";
          red = "#bf656e";
          green = "#83ad84";
          yellow = "#dbc68c";
          blue = "#6286ad";
          magenta = "#8782af";
          cyan = "#7dafac";
          white = "#c0c0c0";
        };
        bright = {
          black = "#606060";
          red = "#bf656e";
          green = "#83ad84";
          yellow = "#dbc68c";
          blue = "#6286ad";
          magenta = "#8782af";
          cyan = "#7dafac";
          white = "#f0f0f0";
        };
      };
    };
  };
}
