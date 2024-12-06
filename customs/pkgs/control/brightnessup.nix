{
  pkgs,
}:
pkgs.writeShellScriptBin "brightnessup" ''brightnessctl set 5%+''
