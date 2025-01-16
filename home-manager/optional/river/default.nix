{ pkgs, ... }:
{
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = builtins.readFile ./init.sh;
  };
xdg.configFile."river/mini-nix.png".source = ./mini-nix.png;
}
