{
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = builtins.readFile ./init.sh;
    settings = {
      background-color = "0x000000";
      set-repeat = "60 280";
      hide-cursor = {
        when-typing = "enabled";
        timeout = 3600;
      };
      default-attach-mode = "bottom";
      map = {
        normal = {
          "Super+Shift C" = "close";
          "Super+Shift Q" = "exit";
          "Super+Shift F8" = "spawn 'wpctl set-volume @DEFAULT_SINK@ 5%+ '";
          "Super+Shift F7" = "spawn 'wpctl set-volume @DEFAULT_SINK@ 5%- '";
          "Super+Shift F6" = "spawn 'wpctl set-mute @DEFAULT_SINK@ toggle'";
          "Super+Shift F11" = "spawn 'brightnessctl set 5%-'";
          "Super+Shift F12" = "spawn 'brightnessctl set 5%+'";
          # "Super+Shift F" = "spawn floorp";
          "Super+Shift Return" = "spawn alacritty";
          "Super R" = "spawn tofi-drun";
          "Super+Control B" =
            "spawn 'notify-send \"Capacity\" \"`echo $(cat /sys/class/power_supply/BAT1/capacity & cat /sys/class/power_supply/BAT1/status)`\"'";
          "Super+Control V" = ''
            spawn 'notify-send "Volume" "`wpctl get-volume @DEFAULT_SINK@ | tr -d Volume: `"' '';
          "Super+Control C" =
            "spawn 'notify-send  \"`date +%H:%M`\" \"`date +%A` `date +%d`. `date +%B`\" '";
          "Super+Control X" =
            "spawn 'notify-send \"Brightness\"  \"`brightnessctl g`\"'";
          "Super J" = "focus-view next";
          "Super K" = "focus-view previous";
          "Super+Shift J" = "swap next";
          "Super+Shift K" = "swap previous";
          "Super Period" = "focus-output next";
          "Super Comma" = "focus-output previous";
          "Super+Shift Period" = "send-to-output next";
          "Super+Shift Comma" = "send-to-output previous";
          "Super Return" = "zoom";
          "Super+Alt H" = "move left 100";
          "Super+Alt J" = "move down 100";
          "Super+Alt K" = "move up 100";
          "Super+Alt L" = "move right 100";
          "Super+Alt+Control H" = "snap left";
          "Super+Alt+Control J" = "snap down";
          "Super+Alt+Control K" = "snap up";
          "Super+Alt+Control L" = "snap right";
          "Super+Alt+Shift H" = "resize horizontal -100";
          "Super+Alt+Shift J" = "resize vertical -100";
          "Super+Alt+Shift K" = "resize vertical 100";
          "Super+Alt+Shift L" = "resize horizontal 100";
          "Super+Control F" = "toggle-fullscreen";
          "Super Space" = "toggle-float";
          "Super+Shift P" = ''spawn 'grim -g "$(slurp)" -| swappy -f -' '';
          "Super P" = "spawn 'grim -| swappy -f -' ";
        };
      };
    };
  };
}
